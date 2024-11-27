import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/exception.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/data/datasources/remote/quraan/quraan_datasource.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/domain/repositories/quraan/quraan_repository.dart';

@LazySingleton(as: QuraanRepository)
class QuranRepositoryImpl implements QuraanRepository {
  final QuraanDataSource remoteDataSource;

  QuranRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Surah>> getListSurah() async {
    try {
      final result = await remoteDataSource.getlistSurah();
      return Right(result.toDomain());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
