import 'package:dartz/dartz.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/domain/entities/doa/doa_data.dart';

abstract class DoaRepository {
  Future<Either<Failure, List<DoaData>>> getListDoa();
}
