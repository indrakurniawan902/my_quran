import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/data/datasources/remote/prayer_time/prayer_time_datasource.dart';
import 'package:my_quran/domain/entities/prayer_time/prayer_time_model.dart';
import 'package:my_quran/domain/repositories/prayer_time/prayer_time_repository.dart';

import '../../common/exception.dart';

@LazySingleton(as: PrayerTimeRepository)
class PrayerTimeRepositoryImpl implements PrayerTimeRepository {
  final PrayerTimeDatasource prayerTimeDatasource;

  PrayerTimeRepositoryImpl({required this.prayerTimeDatasource});
  @override
  Future<Either<Failure, PrayerTimeModel>> getPrayerTime(String latitude, String longitude, String dateNow) async {
    try {
      final result = await prayerTimeDatasource.getPrayerTime(latitude, longitude, dateNow);
      return Right(result.toDomain());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
