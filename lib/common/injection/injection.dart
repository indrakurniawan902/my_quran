import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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
  static const Map<String, String> _certAssets = {
    'equran.id': 'assets/cer/equran_id.pem',
    'doa-doa-api-ahmadramadhan.fly.dev': 'assets/cer/doa_api.pem',
    'api.aladhan.com': 'assets/cer/aladhan.pem',
  };

  @preResolve
  @lazySingleton
  Future<Dio> provideDio() async {
    final dio = Dio(BaseOptions(
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 3000) // Set your API base URL
        ));
    Future<SecurityContext> createSecurityContext() async {
      final securityContext = SecurityContext(withTrustedRoots: false);
      for (final certPath in _certAssets.values) {
        final certBytes = await rootBundle.load(certPath);
        securityContext.setTrustedCertificatesBytes(
          certBytes.buffer.asUint8List(),
        );
      }
      return securityContext;
    }

    final securityContext = await createSecurityContext();
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient(context: securityContext);
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => false;
      return client;
    };

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
