import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/exception.dart';
import 'package:my_quran/data/models/quraan/detail_surah_remote_response.dart';
import 'package:my_quran/data/models/quraan/surah_remote_response.dart';

abstract class QuraanDataSource {
  Future<SurahRemoteResponse> getlistSurah();
  Future<DetailSurahRemoteResponse> getDetailSurah(String noSurah);
}

@LazySingleton(as: QuraanDataSource)
class QuraanDataSourceImpl implements QuraanDataSource {
  final Dio dio;

  QuraanDataSourceImpl({required this.dio});

  @override
  Future<SurahRemoteResponse> getlistSurah() async {
    final response = await dio.get("/surat");
    if (response.statusCode == 200) {
      return SurahRemoteResponse.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<DetailSurahRemoteResponse> getDetailSurah(String noSurah) async {
    final response = await dio.get("/surat/$noSurah");
    if (response.statusCode == 200) {
      return DetailSurahRemoteResponse.fromJson((response.data["data"]));
    } else {
      throw ServerException();
    }
  }
}
