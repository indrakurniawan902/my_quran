import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/common/remote_response_mapper.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';

part 'surah_remote_response.g.dart';

@JsonSerializable()
class SurahRemoteResponse implements ResponseMapper<Surah> {
  final int code;
  final String message;
  final List<DatumRemoteResponse> data;

  SurahRemoteResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SurahRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$SurahRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SurahRemoteResponseToJson(this);

  @override
  Surah toDomain() {
    return Surah(
        code: code,
        message: message,
        data: data.map((e) => e.toDomain()).toList());
  }
}

@JsonSerializable()
class DatumRemoteResponse implements ResponseMapper<Datum> {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final Map<String, String> audioFull;

  DatumRemoteResponse({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
  });

  factory DatumRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$DatumRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DatumRemoteResponseToJson(this);

  @override
  Datum toDomain() {
    return Datum(
        nomor: nomor,
        nama: nama,
        namaLatin: namaLatin,
        jumlahAyat: jumlahAyat,
        tempatTurun: tempatTurun,
        arti: arti,
        deskripsi: deskripsi,
        audioFull: audioFull);
  }
}
