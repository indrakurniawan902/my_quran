import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/exception.dart';
import 'package:my_quran/common/qr_hive_constant.dart';
import 'package:my_quran/data/models/doa/local/doa_local_model.dart';

abstract class DoaLocalDatasource {
  Future<void> setDoaLocal(List<DoaLocalModel> doa);
  Future<List<DoaLocalModel>?> getDoaLocal();
}

@LazySingleton(as: DoaLocalDatasource)
class DoaLocalMemoryDatasource implements DoaLocalDatasource {
  @override
  Future<List<DoaLocalModel>?> getDoaLocal() async {
    try {
      final doaBox = await Hive.openBox(QRHiveConstant.doaBox);
      return doaBox.get(QRHiveConstant.doaBox);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<void> setDoaLocal(List<DoaLocalModel> doa) async {
    try {
      final doaBox = await Hive.openBox(QRHiveConstant.doaBox);
      doaBox.put(QRHiveConstant.doaBox, doa);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
