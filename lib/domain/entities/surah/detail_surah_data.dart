class DetailSurah {
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final AudioFull audioFull;
  final List<Ayat> ayat;

  DetailSurah({
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
}

class AudioFull {
  final String s01;
  final String s02;
  final String s03;
  final String s04;
  final String s05;

  AudioFull(
      {required this.s01,
      required this.s02,
      required this.s03,
      required this.s04,
      required this.s05});
}

class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;
  final AudioFull audio;

  Ayat(
      {required this.nomorAyat,
      required this.teksArab,
      required this.teksLatin,
      required this.teksIndonesia,
      required this.audio});
}
