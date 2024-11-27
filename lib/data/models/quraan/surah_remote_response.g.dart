// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurahRemoteResponse _$SurahRemoteResponseFromJson(Map<String, dynamic> json) =>
    SurahRemoteResponse(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DatumRemoteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahRemoteResponseToJson(
        SurahRemoteResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

DatumRemoteResponse _$DatumRemoteResponseFromJson(Map<String, dynamic> json) =>
    DatumRemoteResponse(
      nomor: (json['nomor'] as num).toInt(),
      nama: json['nama'] as String,
      namaLatin: json['namaLatin'] as String,
      jumlahAyat: (json['jumlahAyat'] as num).toInt(),
      tempatTurun: json['tempatTurun'] as String,
      arti: json['arti'] as String,
      deskripsi: json['deskripsi'] as String,
      audioFull: Map<String, String>.from(json['audioFull'] as Map),
    );

Map<String, dynamic> _$DatumRemoteResponseToJson(
        DatumRemoteResponse instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'namaLatin': instance.namaLatin,
      'jumlahAyat': instance.jumlahAyat,
      'tempatTurun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audioFull': instance.audioFull,
    };
