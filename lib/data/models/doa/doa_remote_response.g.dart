// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doa_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoaRemoteResponse _$DoaRemoteResponseFromJson(Map<String, dynamic> json) =>
    DoaRemoteResponse(
      id: json['id'] as String,
      doa: json['doa'] as String,
      ayat: json['ayat'] as String,
      latin: json['latin'] as String,
      artinya: json['artinya'] as String,
    );

Map<String, dynamic> _$DoaRemoteResponseToJson(DoaRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doa': instance.doa,
      'ayat': instance.ayat,
      'latin': instance.latin,
      'artinya': instance.artinya,
    };
