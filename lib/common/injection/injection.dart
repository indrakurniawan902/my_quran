import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:chucker_flutter/chucker_flutter.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureInjection() => getIt.init();

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio(BaseOptions(
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout:
            const Duration(milliseconds: 3000) // Set your API base URL
        ));

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    dio.interceptors.add(ChuckerDioInterceptor());

    return dio;
  }
}

@module
abstract class FirebaseAuthModule {
  @lazySingleton
  FirebaseAuth provideFirebaseAuth() {
    final auth = FirebaseAuth.instance;
    return auth;
  }
}
