import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/constant.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/data/models/doa/doa_remote_response.dart';

abstract class DoaDatasource {
  Future<List<DoaRemoteResponse>> getlistDoa();
}

@LazySingleton(as: DoaDatasource)
class DoaDataSourceImpl implements DoaDatasource {
  final Dio dio;

  DoaDataSourceImpl({required this.dio});

  @override
  Future<List<DoaRemoteResponse>> getlistDoa() async {
    final response = await dio.get("$BASE_URL_DOA/api");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => DoaRemoteResponse.fromJson(e))
          .toList();
    } else {
      throw const ServerFailure("Something When Wrong");
    }
  }
}
