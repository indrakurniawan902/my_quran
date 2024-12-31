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
import 'package:my_quran/data/datasources/local/quraan/quraan_local_datasource.dart'
    as _i359;
import 'package:my_quran/data/datasources/remote/auth/auth_datasource.dart'
    as _i591;
import 'package:my_quran/data/datasources/remote/doa/doa_datasource.dart'
    as _i69;
import 'package:my_quran/data/datasources/remote/doa/local/doa_local_datasource.dart'
    as _i162;
import 'package:my_quran/data/datasources/remote/quraan/quraan_datasource.dart'
    as _i49;
import 'package:my_quran/data/repositories/auth_repository_impl.dart' as _i195;
import 'package:my_quran/data/repositories/doa_repository_impl.dart' as _i550;
import 'package:my_quran/data/repositories/quraan_repository_impl.dart'
    as _i797;
import 'package:my_quran/domain/repositories/auth/auth_repository.dart'
    as _i1060;
import 'package:my_quran/domain/repositories/doa/doa_repository.dart' as _i809;
import 'package:my_quran/domain/repositories/quraan/quraan_repository.dart'
    as _i982;
import 'package:my_quran/domain/usecase/auth/check_login_google_usecase.dart'
    as _i110;
import 'package:my_quran/domain/usecase/auth/login_google_usecase.dart'
    as _i156;
import 'package:my_quran/domain/usecase/auth/logout_google_usecase.dart'
    as _i490;
import 'package:my_quran/domain/usecase/doa/get_list_doa_usecase.dart'
    as _i1022;
import 'package:my_quran/domain/usecase/surah/get_detail_surah_usecase.dart'
    as _i801;
import 'package:my_quran/domain/usecase/surah/get_list_surah_usecase.dart'
    as _i257;
import 'package:my_quran/presentation/screen/authentication/cubit/auth_cubit.dart'
    as _i198;
import 'package:my_quran/presentation/screen/detail_quraan/cubit/detail_quraan_cubit.dart'
    as _i36;
import 'package:my_quran/presentation/screen/doa/cubit/doa_cubit.dart' as _i605;
import 'package:my_quran/presentation/screen/quraan/cubit/quraan_cubit.dart'
    as _i1000;
import 'package:my_quran/utils/analytics_service.dart' as _i218;
import 'package:my_quran/utils/quraan_dio_err_handler.dart' as _i239;
import 'package:my_quran/utils/quraan_net_client.dart' as _i390;

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
    gh.singleton<_i218.AnalyticsService>(() => _i218.AnalyticsService());
    gh.singleton<_i239.QuraanDioErrHandler>(() => _i239.QuraanDioErrHandler());
    gh.singleton<_i390.QrApiDio>(() => _i390.QrApiDio());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i59.FirebaseAuth>(
        () => firebaseAuthModule.provideFirebaseAuth());
    gh.lazySingleton<_i162.DoaLocalDatasource>(
        () => _i162.DoaLocalMemoryDatasource());
    gh.lazySingleton<_i359.QuraanLocalDatasource>(
        () => _i359.QuraanLocalDatasourceImpl());
    gh.lazySingleton<_i591.AuthDataSource>(
        () => _i591.AuthDataSourceImpl(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i49.QuraanDataSource>(
        () => _i49.QuraanDataSourceImpl(dio: gh<_i390.QrApiDio>()));
    gh.lazySingleton<_i982.QuraanRepository>(() => _i797.QuranRepositoryImpl(
          remoteDataSource: gh<_i49.QuraanDataSource>(),
          quraanDioErrHandler: gh<_i239.QuraanDioErrHandler>(),
          localDatasource: gh<_i359.QuraanLocalDatasource>(),
        ));
    gh.lazySingleton<_i69.DoaDatasource>(
        () => _i69.DoaDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i801.GetDetailSurahUsecase>(() =>
        _i801.GetDetailSurahUsecase(
            quraanRepository: gh<_i982.QuraanRepository>()));
    gh.lazySingleton<_i257.GetListSurahUsecase>(() => _i257.GetListSurahUsecase(
        quraanRepository: gh<_i982.QuraanRepository>()));
    gh.lazySingleton<_i1060.AuthRepository>(() =>
        _i195.AuthRepositoryImpl(authDataSource: gh<_i591.AuthDataSource>()));
    gh.lazySingleton<_i809.DoaRepository>(() => _i550.DoaRepositoryImpl(
          remoteDataSource: gh<_i69.DoaDatasource>(),
          quraanDioErrHandler: gh<_i239.QuraanDioErrHandler>(),
          localDatasource: gh<_i162.DoaLocalDatasource>(),
        ));
    gh.factory<_i1000.QuraanCubit>(
        () => _i1000.QuraanCubit(gh<_i257.GetListSurahUsecase>()));
    gh.lazySingleton<_i110.CheckLoginGoogleUsecase>(() =>
        _i110.CheckLoginGoogleUsecase(
            authRepository: gh<_i1060.AuthRepository>()));
    gh.lazySingleton<_i156.LoginGoogleUseCase>(() =>
        _i156.LoginGoogleUseCase(authRepository: gh<_i1060.AuthRepository>()));
    gh.lazySingleton<_i490.LogoutGoogleUseCase>(() =>
        _i490.LogoutGoogleUseCase(authRepository: gh<_i1060.AuthRepository>()));
    gh.lazySingleton<_i1022.GetListDoaUsecase>(() =>
        _i1022.GetListDoaUsecase(doaRepository: gh<_i809.DoaRepository>()));
    gh.factory<_i36.DetailQuraanCubit>(
        () => _i36.DetailQuraanCubit(gh<_i801.GetDetailSurahUsecase>()));
    gh.factory<_i198.AuthCubit>(() => _i198.AuthCubit(
          gh<_i110.CheckLoginGoogleUsecase>(),
          gh<_i156.LoginGoogleUseCase>(),
          gh<_i490.LogoutGoogleUseCase>(),
        ));
    gh.factory<_i605.DoaCubit>(
        () => _i605.DoaCubit(gh<_i1022.GetListDoaUsecase>()));
    return this;
  }
}

class _$NetworkModule extends _i211.NetworkModule {}

class _$FirebaseAuthModule extends _i211.FirebaseAuthModule {}
