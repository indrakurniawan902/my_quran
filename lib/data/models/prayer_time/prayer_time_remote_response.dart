import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/common/remote_response_mapper.dart';
import 'package:my_quran/domain/entities/prayer_time/prayer_time_model.dart';

part 'prayer_time_remote_response.g.dart';

@JsonSerializable()
class PrayerTimeRemoteResponse implements ResponseMapper<PrayerTimeModel> {
  @JsonKey(name: 'Fajr')
  final String fajr;
  @JsonKey(name: 'Sunrise')
  final String sunrise;
  @JsonKey(name: 'Dhuhr')
  final String dhuhr;
  @JsonKey(name: 'Asr')
  final String asr;
  @JsonKey(name: 'Maghrib')
  final String maghrib;
  @JsonKey(name: 'Isha')
  final String isha;
  @JsonKey(name: 'Imsak')
  final String imsak;

  PrayerTimeRemoteResponse({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.imsak,
  });

  factory PrayerTimeRemoteResponse.fromJson(Map<String, dynamic> json) => _$PrayerTimeRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PrayerTimeRemoteResponseToJson(this);

  @override
  PrayerTimeModel toDomain() {
    return PrayerTimeModel(
      fajr: fajr,
      sunrise: sunrise,
      dhuhr: dhuhr,
      asr: asr,
      maghrib: maghrib,
      isha: isha,
      imsak: imsak,
    );
  }
}
