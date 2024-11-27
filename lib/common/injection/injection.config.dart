// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_quran/common/injection/injection.dart' as _i211;
import 'package:my_quran/data/datasources/remote/quraan/quraan_datasource.dart'
    as _i49;
import 'package:my_quran/data/repositories/quraan_repository_impl.dart'
    as _i797;
import 'package:my_quran/domain/repositories/quraan/quraan_repository.dart'
    as _i982;
import 'package:my_quran/domain/usecase/surah/get_list_surah_usecase.dart'
    as _i257;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i49.QuraanDataSource>(
        () => _i49.QuraanDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i982.QuraanRepository>(() => _i797.QuranRepositoryImpl(
        remoteDataSource: gh<_i49.QuraanDataSource>()));
    gh.lazySingleton<_i257.GetListSurahUsecase>(() => _i257.GetListSurahUsecase(
        quraanRepository: gh<_i982.QuraanRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i211.NetworkModule {}
