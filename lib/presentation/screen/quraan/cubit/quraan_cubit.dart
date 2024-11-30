import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/domain/usecase/surah/get_list_surah_usecase.dart';

part 'quraan_state.dart';

@injectable
class QuraanCubit extends Cubit<QuraanState> {
  final GetListSurahUsecase getListSurahUsecase;
  QuraanCubit(this.getListSurahUsecase) : super(QuraanInitial());

  void getSurah() async {
    emit(QuraanLoading());
    final result = await getListSurahUsecase.call();

    result.fold((failure) {
      emit(QuraanError(message: failure.message));
    }, (data) {
      emit(QuraanSuccess(data: data));
    });
  }
}
