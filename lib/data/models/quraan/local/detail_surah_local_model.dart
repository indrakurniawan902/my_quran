import 'package:hive/hive.dart';
import 'package:my_quran/common/qr_hive_constant.dart';
import 'package:my_quran/common/remote_response_mapper.dart';
import 'package:my_quran/data/models/quraan/detail_surah_remote_response.dart';
import 'package:my_quran/domain/entities/surah/detail_surah_data.dart';

part 'detail_surah_local_model.g.dart';

@HiveType(typeId: QRHiveEntityCode.detailSurah)
class DetailSurahLocalModel implements ResponseMapper<DetailSurah> {
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
  final AudioFullLocalModel audioFull;
  @HiveField(8)
  final List<AyatLocalModel> ayat;

  DetailSurahLocalModel(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.deskripsi,
      required this.audioFull,
      required this.ayat});

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
        ayat: ayat.map((e) => e.toDomain()).toList());
  }

  static DetailSurahLocalModel fromRemote(DetailSurahRemoteResponse response) {
    return DetailSurahLocalModel(
      nomor: response.nomor,
      nama: response.nama,
      namaLatin: response.namaLatin,
      jumlahAyat: response.ayat.length,
      tempatTurun: response.tempatTurun,
      arti: response.arti,
      deskripsi: response.deskripsi,
      audioFull: AudioFullLocalModel.fromRemote(response.audioFull),
      ayat: response.ayat.map((e) => AyatLocalModel.fromRemote(e)).toList(),
    );
  }
}

@HiveType(typeId: QRHiveEntityCode.ayatSurah)
class AyatLocalModel implements ResponseMapper<Ayat> {
  @HiveField(0)
  final int nomorAyat;
  @HiveField(1)
  final String teksArab;
  @HiveField(2)
  final String teksLatin;
  @HiveField(3)
  final String teksIndonesia;
  @HiveField(4)
  final AudioFullLocalModel audio;

  AyatLocalModel(
      {required this.nomorAyat,
      required this.teksArab,
      required this.teksLatin,
      required this.teksIndonesia,
      required this.audio});

  @override
  Ayat toDomain() {
    return Ayat(
        nomorAyat: nomorAyat,
        teksArab: teksArab,
        teksLatin: teksLatin,
        teksIndonesia: teksIndonesia,
        audio: audio.toDomain());
  }

  static AyatLocalModel fromRemote(AyatRemoteResponse ayat) {
    return AyatLocalModel(
      nomorAyat: ayat.nomorAyat,
      teksArab: ayat.teksArab,
      teksLatin: ayat.teksLatin,
      teksIndonesia: ayat.teksIndonesia,
      audio: AudioFullLocalModel.fromRemote(ayat.audio),
    );
  }
}

@HiveType(typeId: QRHiveEntityCode.audioFull)
class AudioFullLocalModel implements ResponseMapper<AudioFull> {
  @HiveField(0)
  final String s01;
  @HiveField(1)
  final String s02;
  @HiveField(2)
  final String s03;
  @HiveField(3)
  final String s04;
  @HiveField(4)
  final String s05;

  AudioFullLocalModel(
      {required this.s01,
      required this.s02,
      required this.s03,
      required this.s04,
      required this.s05});

  @override
  AudioFull toDomain() {
    return AudioFull(s01: s01, s02: s02, s03: s03, s04: s04, s05: s05);
  }

  static AudioFullLocalModel fromRemote(AudioFullRemoteResponse audio) {
    return AudioFullLocalModel(
      s01: audio.s01,
      s02: audio.s02,
      s03: audio.s03,
      s04: audio.s04,
      s05: audio.s05,
    );
  }
}
