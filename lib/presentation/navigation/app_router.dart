import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/globals.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/screen/authentication/login_screen.dart';
import 'package:my_quran/presentation/screen/detail_quraan/detail_quraan_screen.dart';
import 'package:my_quran/presentation/screen/menu/menu_screen.dart';
import 'package:my_quran/presentation/screen/quraan/quraan_screen.dart';

import '../screen/detail_quraan/detail_quraan_params.dart';

final GoRouter qrGlobalRouter = GoRouter(
    navigatorKey: AppGlobals.navigatorKey,
    observers: [ChuckerFlutter.navigatorObserver],
    initialLocation: "/login",
    routes: [
      GoRoute(
        path: "/login",
        name: AppRoutes.nrLogin,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/home",
        name: AppRoutes.nrHome,
        builder: (context, state) => const QuraanScreen(),
      ),
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
        path: "/detailQuraan",
        name: AppRoutes.nrDetailQuraan,
        builder: (context, state) {
          DetailQuraanParams params = state.extra as DetailQuraanParams;
          return DetailQuraanScreen(params: params);
        },
      ),
    ]);
