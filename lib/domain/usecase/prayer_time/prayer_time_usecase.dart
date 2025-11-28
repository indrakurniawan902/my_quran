import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/domain/entities/prayer_time/prayer_time_model.dart';
import 'package:my_quran/domain/repositories/prayer_time/prayer_time_repository.dart';

@lazySingleton
class PrayerTimeUsecase {
  final PrayerTimeRepository prayerTimeRepository;
  PrayerTimeUsecase({required this.prayerTimeRepository});

  Future<Either<Failure, PrayerTimeModel>> call(String latitude, String longitude, String dateNow) {
    return prayerTimeRepository.getPrayerTime(latitude, longitude, dateNow);
  }
}
