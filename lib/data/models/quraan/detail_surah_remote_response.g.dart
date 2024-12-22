// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_surah_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailSurahRemoteResponse _$DetailSurahRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    DetailSurahRemoteResponse(
      nomor: (json['nomor'] as num).toInt(),
      nama: json['nama'] as String,
      namaLatin: json['namaLatin'] as String,
      jumlahAyat: (json['jumlahAyat'] as num).toInt(),
      tempatTurun: json['tempatTurun'] as String,
      arti: json['arti'] as String,
      deskripsi: json['deskripsi'] as String,
      audioFull: AudioFullRemoteResponse.fromJson(
          json['audioFull'] as Map<String, dynamic>),
      ayat: (json['ayat'] as List<dynamic>)
          .map((e) => AyatRemoteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailSurahRemoteResponseToJson(
        DetailSurahRemoteResponse instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audioFull': instance.audioFull,
      'ayat': instance.ayat,
    };

AudioFullRemoteResponse _$AudioFullRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    AudioFullRemoteResponse(
      s01: json['01'] as String,
      s02: json['02'] as String,
      s03: json['03'] as String,
      s04: json['04'] as String,
      s05: json['05'] as String,
    );

Map<String, dynamic> _$AudioFullRemoteResponseToJson(
        AudioFullRemoteResponse instance) =>
    <String, dynamic>{
      '01': instance.s01,
      '02': instance.s02,
      '03': instance.s03,
      '04': instance.s04,
      '05': instance.s05,
    };

AyatRemoteResponse _$AyatRemoteResponseFromJson(Map<String, dynamic> json) =>
    AyatRemoteResponse(
      nomorAyat: (json['nomorAyat'] as num).toInt(),
      teksArab: json['teksArab'] as String,
      teksLatin: json['teksLatin'] as String,
      teksIndonesia: json['teksIndonesia'] as String,
      audio: AudioFullRemoteResponse.fromJson(
          json['audio'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AyatRemoteResponseToJson(AyatRemoteResponse instance) =>
    <String, dynamic>{
      'nomorAyat': instance.nomorAyat,
      'teksArab': instance.teksArab,
      'teksLatin': instance.teksLatin,
      'teksIndonesia': instance.teksIndonesia,
      'audio': instance.audio,
    };
