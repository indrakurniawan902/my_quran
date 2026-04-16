import 'dart:ui';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_quran/common/flavor_config.dart';
import 'package:my_quran/common/injection/injection.dart';
import 'package:my_quran/data/models/doa/local/doa_local_model.dart';
import 'package:my_quran/data/models/quraan/local/detail_surah_local_model.dart';
import 'package:my_quran/data/models/quraan/local/surah_local_model.dart';
import 'package:my_quran/firebase_options.dart';
import 'package:my_quran/presentation/navigation/app_router.dart';
import 'package:my_quran/utils/colors.dart';

Future<void> bootstrap(FlavorConfig flavor) async {
  FlavorConfig.current = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('id_ID', null);
  ChuckerFlutter.showOnRelease = true;
  ChuckerFlutter.showNotification = true;
  ChuckerFlutter.isDebugMode = true;
  configureInjection();
  _initHiveAdapters();
  // firebase crashlytics non fatal
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: false);
    return true;
  };
  runApp(MyApp(flavor: flavor));
}

void _initHiveAdapters() async {
  await Hive.initFlutter();
  // register all adapter
  Hive.registerAdapter(DoaLocalModelAdapter());
  Hive.registerAdapter(DetailSurahLocalModelAdapter());
  Hive.registerAdapter(SurahLocalModelAdapter());
  Hive.registerAdapter(AyatLocalModelAdapter());
  Hive.registerAdapter(AudioFullLocalModelAdapter());
  Hive.registerAdapter(DatumLocalModelAdapter());
}

class MyApp extends StatelessWidget {
  final FlavorConfig flavor;
  const MyApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'My Quran',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryGreen),
            useMaterial3: true,
            fontFamily: 'Montserrat',
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder()
            })),
        routeInformationProvider: qrGlobalRouter.routeInformationProvider,
        routeInformationParser: qrGlobalRouter.routeInformationParser,
        routerDelegate: qrGlobalRouter.routerDelegate,
      ),
    );
  }
}
