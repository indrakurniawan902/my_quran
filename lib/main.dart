import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_quran/common/injection/injection.dart';
import 'package:my_quran/firebase_options.dart';
import 'package:my_quran/presentation/navigation/app_router.dart';
import 'package:my_quran/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'My Quran',
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryGreen),
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
