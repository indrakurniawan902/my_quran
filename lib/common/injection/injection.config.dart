// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_quran/common/injection/injection.dart' as _i211;
import 'package:my_quran/data/datasources/remote/auth/auth_datasource.dart'
    as _i591;
import 'package:my_quran/data/datasources/remote/quraan/quraan_datasource.dart'
    as _i49;
import 'package:my_quran/data/repositories/auth_repository_impl.dart' as _i195;
import 'package:my_quran/data/repositories/quraan_repository_impl.dart'
    as _i797;
import 'package:my_quran/domain/repositories/auth/auth_repository.dart'
    as _i1060;
import 'package:my_quran/domain/repositories/quraan/quraan_repository.dart'
    as _i982;
import 'package:my_quran/domain/usecase/auth/auth_usecase.dart' as _i570;
import 'package:my_quran/domain/usecase/surah/get_detail_surah_usecase.dart'
    as _i801;
import 'package:my_quran/domain/usecase/surah/get_list_surah_usecase.dart'
    as _i257;
import 'package:my_quran/presentation/screen/authentication/cubit/auth_cubit.dart'
    as _i198;
import 'package:my_quran/presentation/screen/detail_quraan/cubit/detail_quraan_cubit.dart'
    as _i36;
import 'package:my_quran/presentation/screen/quraan/cubit/quraan_cubit.dart'
    as _i1000;

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
    final firebaseAuthModule = _$FirebaseAuthModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i59.FirebaseAuth>(
        () => firebaseAuthModule.provideFirebaseAuth());
    gh.lazySingleton<_i591.AuthDataSource>(
        () => _i591.AuthDataSourceImpl(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i49.QuraanDataSource>(
        () => _i49.QuraanDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i1060.AuthRepository>(() =>
        _i195.AuthRepositoryImpl(authDataSource: gh<_i591.AuthDataSource>()));
    gh.lazySingleton<_i982.QuraanRepository>(() => _i797.QuranRepositoryImpl(
        remoteDataSource: gh<_i49.QuraanDataSource>()));
    gh.lazySingleton<_i570.AuthUsecase>(
        () => _i570.AuthUsecase(authRepository: gh<_i1060.AuthRepository>()));
    gh.factory<_i198.AuthCubit>(
        () => _i198.AuthCubit(authUsecase: gh<_i570.AuthUsecase>()));
    gh.lazySingleton<_i257.GetListSurahUsecase>(() => _i257.GetListSurahUsecase(
        quraanRepository: gh<_i982.QuraanRepository>()));
    gh.lazySingleton<_i801.GetDetailSurahUsecase>(() =>
        _i801.GetDetailSurahUsecase(
            quraanRepository: gh<_i982.QuraanRepository>()));
    gh.factory<_i1000.QuraanCubit>(
        () => _i1000.QuraanCubit(gh<_i257.GetListSurahUsecase>()));
    gh.factory<_i36.DetailQuraanCubit>(
        () => _i36.DetailQuraanCubit(gh<_i801.GetDetailSurahUsecase>()));
    return this;
  }
}

class _$NetworkModule extends _i211.NetworkModule {}

class _$FirebaseAuthModule extends _i211.FirebaseAuthModule {}
