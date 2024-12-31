import 'package:my_quran/common/qr_hive_constant.dart';
import 'package:my_quran/common/remote_response_mapper.dart';
import 'package:my_quran/data/models/quraan/surah_remote_response.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:hive/hive.dart';
part 'surah_local_model.g.dart';

@HiveType(typeId: QRHiveEntityCode.surah)
class SurahLocalModel implements ResponseMapper<Surah> {
  @HiveField(0)
  final int code;
  @HiveField(1)
  final String message;
  @HiveField(2)
  final List<DatumLocalModel> data;

  SurahLocalModel(
      {required this.code, required this.message, required this.data});

  @override
  Surah toDomain() {
    return Surah(
      code: code,
      message: message,
      data: data.map((e) => e.toDomain()).toList(),
    );
  }

  static SurahLocalModel fromDomain(Surah data) {
    return SurahLocalModel(
      code: data.code,
      message: data.message,
      data: data.data.map((e) => DatumLocalModel.fromDomain(e)).toList(),
    );
  }

  static SurahLocalModel fromRemote(SurahRemoteResponse data) {
    return SurahLocalModel(
      code: data.code,
      message: data.message,
      data: data.data.map((e) => DatumLocalModel.fromRemote(e)).toList(),
    );
  }
}

@HiveType(typeId: QRHiveEntityCode.datum)
class DatumLocalModel implements ResponseMapper<Datum> {
  @HiveField(0)
  final int nomor;
  @HiveField(1)
  final String nama;
  @HiveField(2)
  final String namaLatin;
  @HiveField(3)
  final int jumlahAyat;
  @HiveField(4)
  final String tempatTurun;
  @HiveField(5)
  final String arti;
  @HiveField(6)
  final String deskripsi;
  @HiveField(7)
  final Map<String, String> audioFull;

  DatumLocalModel(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.deskripsi,
      required this.audioFull});

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
      audioFull: audioFull,
    );
  }

  static DatumLocalModel fromDomain(Datum data) {
    return DatumLocalModel(
      nomor: data.nomor,
      nama: data.nama,
      namaLatin: data.namaLatin,
      jumlahAyat: data.jumlahAyat,
      tempatTurun: data.tempatTurun,
      arti: data.arti,
      deskripsi: data.deskripsi,
      audioFull: data.audioFull,
    );
  }

  static DatumLocalModel fromRemote(DatumRemoteResponse data) {
    return DatumLocalModel(
      nomor: data.nomor,
      nama: data.nama,
      namaLatin: data.namaLatin,
      jumlahAyat: data.jumlahAyat,
      tempatTurun: data.tempatTurun,
      arti: data.arti,
      deskripsi: data.deskripsi,
      audioFull: data.audioFull,
    );
  }
}
