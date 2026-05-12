import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:my_quran/domain/entities/prayer_time/prayer_time_model.dart';
import 'package:my_quran/domain/usecase/prayer_time/prayer_time_usecase.dart';
import 'package:geocoding/geocoding.dart';

part 'prayer_time_state.dart';

@injectable
class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeUsecase prayerTimeUsecase;
  PrayerTimeCubit({required this.prayerTimeUsecase}) : super(PrayerTimeInitial());

  void getPrayerTime() async {
    emit(PrayerTimeLoading());
    final dateNow = DateFormat('dd-MM-yyyy').format(DateTime.now());

    final position = await determinePosition();
    final result = await prayerTimeUsecase.call(position.latitude.toString(), position.longitude.toString(), dateNow);
    final dataLocation = await placemarkFromCoordinates(position.latitude, position.longitude);
    return result.fold((failure) {
      emit(PrayerTimeError(message: failure.message));
    }, (data) {
      emit(PrayerTimeSuccess(
        data: data,
        currentlocation:
            '${dataLocation[0].subAdministrativeArea}, ${dataLocation[0].administrativeArea} - ${dataLocation[0].country}',
      ));
    });
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
