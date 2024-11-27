import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/domain/repositories/quraan/quraan_repository.dart';

@lazySingleton
class GetListSurahUsecase {
  final QuraanRepository quraanRepository;

  GetListSurahUsecase({required this.quraanRepository});

  Future<Either<Failure, Surah>> call() {
    return quraanRepository.getListSurah();
  }
}
