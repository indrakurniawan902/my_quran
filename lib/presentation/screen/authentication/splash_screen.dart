// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/screen/authentication/cubit/auth_cubit.dart';
import 'package:my_quran/utils/colors.dart';

import '../../../common/injection/injection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthCubit _authCubit = getIt<AuthCubit>();
  @override
  void initState() {
    _authCubit.signinWithGoogle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<AuthCubit>.value(value: _authCubit)],
        child: Scaffold(
          backgroundColor: AppColors.primaryGreen,
          body: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              print('state : $state');
              if (state is AuthSuccess) {
                Future.delayed(const Duration(seconds: 2),
                    () => context.goNamed(AppRoutes.nrMenu));
              } else {
                Future.delayed(const Duration(seconds: 2),
                    () => context.goNamed(AppRoutes.nrLogin));
              }
            },
            child: Center(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/images/quran.png")),
            ),
          ),
        ));
  }
}
