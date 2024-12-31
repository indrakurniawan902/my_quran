import 'package:hive/hive.dart';
import 'package:my_quran/common/qr_hive_constant.dart';
import 'package:my_quran/common/remote_response_mapper.dart';
import 'package:my_quran/data/models/doa/doa_remote_response.dart';
import 'package:my_quran/domain/entities/doa/doa_data.dart';

part 'doa_local_model.g.dart';

@HiveType(typeId: QRHiveEntityCode.doa)
class DoaLocalModel implements ResponseMapper<DoaData> {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String doa;
  @HiveField(2)
  final String ayat;
  @HiveField(3)
  final String latin;
  @HiveField(4)
  final String artinya;

  DoaLocalModel(
      {required this.id,
      required this.doa,
      required this.ayat,
      required this.latin,
      required this.artinya});

  @override
  DoaData toDomain() {
    return DoaData(
        id: id, judul: doa, latin: latin, arab: ayat, terjemah: artinya);
  }

  static DoaLocalModel fromDomain(DoaData domain) {
    return DoaLocalModel(
      id: domain.id,
      doa: domain.judul,
      ayat: domain.arab,
      latin: domain.latin,
      artinya: domain.terjemah,
    );
  }

  static List<DoaLocalModel> fromRemote(List<DoaRemoteResponse> dataList) {
    return dataList.map((data) {
      return DoaLocalModel(
        id: data.id,
        doa: data.doa,
        ayat: data.ayat,
        latin: data.latin,
        artinya: data.artinya,
      );
    }).toList();
  }
}
