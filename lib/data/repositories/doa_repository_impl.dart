import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/data/datasources/remote/doa/doa_datasource.dart';
import 'package:my_quran/data/datasources/remote/doa/local/doa_local_datasource.dart';
import 'package:my_quran/data/models/doa/local/doa_local_model.dart';
import 'package:my_quran/domain/entities/doa/doa_data.dart';
import 'package:my_quran/domain/repositories/doa/doa_repository.dart';
import 'package:my_quran/utils/quraan_dio_err_handler.dart';

@LazySingleton(as: DoaRepository)
class DoaRepositoryImpl implements DoaRepository {
  final DoaDatasource remoteDataSource;
  final QuraanDioErrHandler quraanDioErrHandler;
  final DoaLocalDatasource localDatasource;

  DoaRepositoryImpl({required this.remoteDataSource, required this.quraanDioErrHandler, required this.localDatasource});
  @override
  Future<Either<Failure, List<DoaData>>> getListDoa() async {
    try {
      final result = await localDatasource.getDoaLocal();
      if (result != null && result.isNotEmpty) {
        final domainList = result.map((item) => item.toDomain()).toList();
        return Right(domainList);
      } else {
        final result = await remoteDataSource.getlistDoa();
        final domainList = result.map((item) => item.toDomain()).toList();
        final localModels = DoaLocalModel.fromRemote(result);
        await localDatasource.setDoaLocal(localModels);

        return Right(domainList);
      }
    } on DioException catch (e) {
      final error = quraanDioErrHandler.handleDioError(e);
      return Left(ConnectionFailure(error));
    } catch (e) {
      return Left(ConnectionFailure(e.toString()));
    }
  }
}
