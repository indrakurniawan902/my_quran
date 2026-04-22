import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/constant.dart';
import 'package:my_quran/common/exception.dart';
import 'package:my_quran/data/models/prayer_time/prayer_time_remote_response.dart';

abstract class PrayerTimeDatasource {
  Future<PrayerTimeRemoteResponse> getPrayerTime(String latitude, String longitude, String dateNow);
}

@LazySingleton(as: PrayerTimeDatasource)
class PrayerTimeDatasourceImpl implements PrayerTimeDatasource {
  final Dio dio;
  PrayerTimeDatasourceImpl({required this.dio});

  @override
  Future<PrayerTimeRemoteResponse> getPrayerTime(String latitude, String longitude, String dateNow) async {
    final response = await dio.get("$BASE_URL_PRAYER_TIME/timings/$dateNow?latitude=$latitude&longitude=$longitude");
    if (response.statusCode == 200) {
      return PrayerTimeRemoteResponse.fromJson(response.data["data"]["timings"]);
    } else {
      throw ServerException();
    }
  }
}
