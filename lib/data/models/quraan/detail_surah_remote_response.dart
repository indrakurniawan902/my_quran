import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/common/remote_response_mapper.dart';
import 'package:my_quran/domain/entities/surah/detail_surah_data.dart';

part 'detail_surah_remote_response.g.dart';

@JsonSerializable()
class DetailSurahRemoteResponse implements ResponseMapper<DetailSurah> {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final AudioFullRemoteResponse audioFull;
  final List<AyatRemoteResponse> ayat;

  DetailSurahRemoteResponse({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
  });

  factory DetailSurahRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailSurahRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailSurahRemoteResponseToJson(this);

  @override
  DetailSurah toDomain() {
    return DetailSurah(
      nomor: nomor,
      nama: nama,
      namaLatin: namaLatin,
      jumlahAyat: jumlahAyat,
      tempatTurun: tempatTurun,
      arti: arti,
      deskripsi: deskripsi,
      audioFull: audioFull.toDomain(),
      ayat: ayat.map((e) => e.toDomain()).toList(),
    );
  }
}

@JsonSerializable()
class AudioFullRemoteResponse implements ResponseMapper<AudioFull> {
  @JsonKey(name: '01')
  final String s01;
  @JsonKey(name: '02')
  final String s02;
  @JsonKey(name: '03')
  final String s03;
  @JsonKey(name: '04')
  final String s04;
  @JsonKey(name: '05')
  final String s05;

  AudioFullRemoteResponse(
      {required this.s01,
      required this.s02,
      required this.s03,
      required this.s04,
      required this.s05});

  factory AudioFullRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$AudioFullRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AudioFullRemoteResponseToJson(this);

  @override
  AudioFull toDomain() {
    return AudioFull(
      s01: s01,
      s02: s02,
      s03: s03,
      s04: s04,
      s05: s05,
    );
  }
}

@JsonSerializable()
class AyatRemoteResponse implements ResponseMapper<Ayat> {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final AudioFullRemoteResponse audio;

  AyatRemoteResponse(
      {required this.nomorAyat,
      required this.teksArab,
      required this.teksLatin,
      required this.teksIndonesia,
      required this.audio});

  factory AyatRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$AyatRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AyatRemoteResponseToJson(this);

  @override
  Ayat toDomain() {
    return Ayat(
      nomorAyat: nomorAyat,
      teksArab: teksArab,
      teksLatin: teksLatin,
      teksIndonesia: teksIndonesia,
      audio: audio.toDomain(),
    );
  }
}
