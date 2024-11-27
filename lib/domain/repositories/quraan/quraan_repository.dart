import 'package:dartz/dartz.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';

abstract class QuraanRepository {
  Future<Either<Failure, Surah>> getListSurah();
}
