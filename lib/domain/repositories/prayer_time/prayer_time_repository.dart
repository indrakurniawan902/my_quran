import 'package:dartz/dartz.dart';
import 'package:my_quran/common/failure.dart';

import '../../entities/prayer_time/prayer_time_model.dart';

abstract class PrayerTimeRepository {
  Future<Either<Failure, PrayerTimeModel>> getPrayerTime(String latitude, String longitude, String dateNow);
}
