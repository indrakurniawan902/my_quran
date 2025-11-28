import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/globals.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/screen/audio/audio_screen.dart';
import 'package:my_quran/presentation/screen/authentication/login_screen.dart';
import 'package:my_quran/presentation/screen/authentication/splash_screen.dart';
import 'package:my_quran/presentation/screen/detail_quraan/detail_quraan_screen.dart';
import 'package:my_quran/presentation/screen/doa/doa_screen.dart';
import 'package:my_quran/presentation/screen/menu/menu_screen.dart';
import 'package:my_quran/presentation/screen/prayer_time/prayer_time_screen.dart';
import 'package:my_quran/presentation/screen/quraan/quraan_screen.dart';
import 'package:my_quran/utils/analytics_service.dart';

import '../screen/detail_quraan/detail_quraan_params.dart';

final GoRouter qrGlobalRouter = GoRouter(
    navigatorKey: AppGlobals.navigatorKey,
    observers: [
      ChuckerFlutter.navigatorObserver,
      AnalyticsService().getAnaliticsObserver()
    ],
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: "/splash",
        name: AppRoutes.nrSplash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/login",
        name: AppRoutes.nrLogin,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
          path: "/home",
          name: AppRoutes.nrQuraan,
          builder: (context, state) {
            final data = state.extra as String;
            return QuraanScreen(data: data);
          }),
      // GoRoute(
      //   path: '/chat-room',
      //   name: AppRoutes.nrChatRoom,
      //   builder: (context, state) {
      //     ChatParams params = state.extra as ChatParams;
      //     return ChatScreen(params: params);
      //   },
      // ),
      GoRoute(
        path: "/menu",
        name: AppRoutes.nrMenu,
        builder: (context, state) => const MenuScreen(),
      ),

      GoRoute(
        path: "/${AppRoutes.nrDetailAudio}",
        name: AppRoutes.nrDetailAudio,
        builder: (context, state) {
          Datum params = state.extra as Datum;
          return AudioScreen(surah: params);
        },
      ),
      GoRoute(
        path: "/detailQuraan",
        name: AppRoutes.nrDetailQuraan,
        builder: (context, state) {
          DetailQuraanParams params = state.extra as DetailQuraanParams;
          return DetailQuraanScreen(params: params);
        },
      ),
      GoRoute(
        path: "/doa",
        name: AppRoutes.nrDoa,
        builder: (context, state) => const DoaScreen(),
      ),
      GoRoute(
        path: "/waktuShalat",
        name: AppRoutes.nrWaktuShalat,
        builder: (context, state) => const PrayerTimeScreen(),
      ),
    ]);
