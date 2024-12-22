import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/entities/surah/detail_surah_data.dart';
import 'package:my_quran/domain/usecase/surah/get_detail_surah_usecase.dart';

part 'detail_quraan_state.dart';

@injectable
class DetailQuraanCubit extends Cubit<DetailQuraanState> {
  final GetDetailSurahUsecase getDetailSurahUsecase;
  DetailQuraanCubit(this.getDetailSurahUsecase) : super(DetailQuraanInitial());

  void getDetailSurah(String noSurah) async {
    emit(DetailQuraanLoading());
    final result = await getDetailSurahUsecase.call(noSurah);
    result.fold((failure) {
      emit(DetailQuraanError(failure.message));
    }, (data) {
      emit(DetailQuraanSuccess(data));
    });
  }
}
