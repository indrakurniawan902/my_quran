import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/entities/doa/doa_data.dart';
import 'package:my_quran/domain/usecase/doa/get_list_doa_usecase.dart';

part 'doa_state.dart';

@injectable
class DoaCubit extends Cubit<DoaState> {
  final GetListDoaUsecase _getListDoaUsecase;

  DoaCubit(this._getListDoaUsecase) : super(DoaInitial());

  void getDoa() async {
    emit(DoaLoading());
    final result = await _getListDoaUsecase.call();

    result.fold(
      (failure) {
        emit(DoaError(error: failure.message));
      },
      (r) {
        emit(DoaSuccess(doa: r));
      },
    );
  }
}
