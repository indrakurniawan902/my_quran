import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/data/datasources/local/quraan/quraan_local_datasource.dart';
import 'package:my_quran/data/datasources/remote/quraan/quraan_datasource.dart';
import 'package:my_quran/data/models/quraan/local/detail_surah_local_model.dart';
import 'package:my_quran/data/models/quraan/local/surah_local_model.dart';
import 'package:my_quran/domain/entities/surah/detail_surah_data.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/domain/repositories/quraan/quraan_repository.dart';
import 'package:my_quran/utils/quraan_dio_err_handler.dart';

@LazySingleton(as: QuraanRepository)
class QuranRepositoryImpl implements QuraanRepository {
  final QuraanDataSource remoteDataSource;
  final QuraanLocalDatasource localDatasource;
  final QuraanDioErrHandler quraanDioErrHandler;

  QuranRepositoryImpl(
      {required this.remoteDataSource,
      required this.quraanDioErrHandler,
      required this.localDatasource});

  @override
  Future<Either<Failure, Surah>> getListSurah() async {
    try {
      final result = await localDatasource.getSurahLocal();
      if (result != null) {
        return Right(result.toDomain());
      } else {
        final response = await remoteDataSource.getlistSurah();
        await localDatasource
            .setSurahLocal(SurahLocalModel.fromRemote(response));
        return Right(response.toDomain());
      }
    } on DioException catch (e) {
      final error = quraanDioErrHandler.handleDioError(e);
      return Left(ConnectionFailure(error));
    } catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DetailSurah>> getDetailSurah(String noSurah) async {
    try {
      final result = await localDatasource.getDetailSurahLocal();
      if (result != null && result.nomor == int.parse(noSurah)) {
        return Right(result.toDomain());
      } else {
        final response = await remoteDataSource.getDetailSurah(noSurah);
        await localDatasource
            .setDetailSurahLocal(DetailSurahLocalModel.fromRemote(response));
        return Right(response.toDomain());
      }
    } on DioException catch (e) {
      final error = quraanDioErrHandler.handleDioError(e);
      return Left(ConnectionFailure(error));
    } catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }
}
