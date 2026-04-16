// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_time_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimeRemoteResponse _$PrayerTimeRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    PrayerTimeRemoteResponse(
      fajr: json['Fajr'] as String,
      sunrise: json['Sunrise'] as String,
      dhuhr: json['Dhuhr'] as String,
      asr: json['Asr'] as String,
      maghrib: json['Maghrib'] as String,
      isha: json['Isha'] as String,
      imsak: json['Imsak'] as String,
    );

Map<String, dynamic> _$PrayerTimeRemoteResponseToJson(
        PrayerTimeRemoteResponse instance) =>
    <String, dynamic>{
      'Fajr': instance.fajr,
      'Sunrise': instance.sunrise,
      'Dhuhr': instance.dhuhr,
      'Asr': instance.asr,
      'Maghrib': instance.maghrib,
      'Isha': instance.isha,
      'Imsak': instance.imsak,
    };
