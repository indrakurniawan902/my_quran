import 'dart:developer';

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
      final dynamic data = doaBox.get(QRHiveConstant.doaBox);

      if (data == null) {
        log('📦 No doa in cache');
        return null;
      }

      // ✅ Cast ke List<DoaLocalModel>
      if (data is List) {
        final result = data.cast<DoaLocalModel>();
        log('✅ Loaded ${result.length} doa from cache');
        return result;
      }

      log('⚠️ Invalid data type in cache');
      return null;
    } catch (e, stackTrace) {
      log('❌ Cache error: $e');
      log('Stack: $stackTrace');
      return null; // ✅ Return null instead of throwing
    }
  }

  @override
  Future<void> setDoaLocal(List<DoaLocalModel> doa) async {
    try {
      final doaBox = await Hive.openBox(QRHiveConstant.doaBox);
      await doaBox.put(QRHiveConstant.doaBox, doa);
      log('✅ Saved ${doa.length} doa to cache');
    } catch (e, stackTrace) {
      log('❌ Cache save error: $e');
      log('Stack: $stackTrace');
      throw CacheException(e.toString());
    }
  }
}
