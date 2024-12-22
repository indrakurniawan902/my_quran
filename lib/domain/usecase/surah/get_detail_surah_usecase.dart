import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/domain/entities/surah/detail_surah_data.dart';
import 'package:my_quran/domain/repositories/quraan/quraan_repository.dart';

@lazySingleton
class GetDetailSurahUsecase {
  final QuraanRepository quraanRepository;

  GetDetailSurahUsecase({required this.quraanRepository});

  Future<Either<Failure, DetailSurah>> call(String noSurah) {
    return quraanRepository.getDetailSurah(noSurah);
  }
}
