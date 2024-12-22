import 'package:go_router/go_router.dart';
import 'package:my_quran/domain/entities/surah/surah_data.dart';
import 'package:my_quran/globals.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/screen/audio/audio_screen.dart';
import 'package:my_quran/presentation/screen/authentication/login_screen.dart';
import 'package:my_quran/presentation/screen/menu/menu_screen.dart';
import 'package:my_quran/presentation/screen/quraan/quraan_screen.dart';

final GoRouter qrGlobalRouter = GoRouter(
    navigatorKey: AppGlobals.navigatorKey,
    initialLocation: "/login",
    routes: [
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
      )
    ]);
