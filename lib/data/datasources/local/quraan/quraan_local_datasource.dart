import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/exception.dart';
import 'package:my_quran/common/qr_hive_constant.dart';
import 'package:my_quran/data/models/quraan/local/detail_surah_local_model.dart';
import 'package:my_quran/data/models/quraan/local/surah_local_model.dart';

abstract class QuraanLocalDatasource {
  Future<void> setSurahLocal(SurahLocalModel surah);
  Future<SurahLocalModel?> getSurahLocal();
  Future<void> setDetailSurahLocal(DetailSurahLocalModel detail);
  Future<DetailSurahLocalModel?> getDetailSurahLocal();
}

@LazySingleton(as: QuraanLocalDatasource)
class QuraanLocalDatasourceImpl extends QuraanLocalDatasource {
  @override
  Future<SurahLocalModel?> getSurahLocal() async {
    try {
      final surahBox = await Hive.openBox(QRHiveConstant.surahBox);
      return surahBox.get(QRHiveConstant.surahBox);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<void> setSurahLocal(SurahLocalModel surah) async {
    try {
      final surahBox = await Hive.openBox(QRHiveConstant.surahBox);
      surahBox.put(QRHiveConstant.surahBox, surah);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<DetailSurahLocalModel?> getDetailSurahLocal() async {
    try {
      final detailSurahBox = await Hive.openBox(QRHiveConstant.detailSurahBox);
      return detailSurahBox.get(QRHiveConstant.detailSurahBox);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<void> setDetailSurahLocal(DetailSurahLocalModel detail) async {
    try {
      final detailSurahBox = await Hive.openBox(QRHiveConstant.detailSurahBox);
      detailSurahBox.put(QRHiveConstant.detailSurahBox, detail);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
