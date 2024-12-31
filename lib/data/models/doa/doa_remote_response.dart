import 'package:json_annotation/json_annotation.dart';
import 'package:my_quran/common/remote_response_mapper.dart';
import 'package:my_quran/domain/entities/doa/doa_data.dart';

part 'doa_remote_response.g.dart';

@JsonSerializable()
class DoaRemoteResponse implements ResponseMapper<DoaData> {
  final String id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  DoaRemoteResponse(
      {required this.id,
      required this.doa,
      required this.ayat,
      required this.latin,
      required this.artinya});

  factory DoaRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$DoaRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DoaRemoteResponseToJson(this);

  @override
  DoaData toDomain() {
    return DoaData(
        id: id, judul: doa, latin: latin, arab: ayat, terjemah: artinya);
  }
}
