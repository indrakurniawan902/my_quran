import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/screen/authentication/cubit/auth_cubit.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/analytics_service.dart';
import 'package:my_quran/utils/colors.dart';

import '../../../common/injection/injection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthCubit _authCubit = getIt<AuthCubit>();
  final AnalyticsService _analyticsService = getIt<AnalyticsService>();

  // send analytics to firebase
  Future<void> _sendAnalyticEventPage() async {
    await _analyticsService.analytics.logEvent(name: "page_viewed_login", parameters: <String, Object>{
      "page_name": "login",
      "section_name": "login",
    });
  }

  Future<void> _sendAnalyticEventClick(String name) async {
    await _analyticsService.analytics.logEvent(name: "login_button_clicked", parameters: <String, Object>{
      "section_name": name,
    });
  }

  @override
  void initState() {
    _sendAnalyticEventPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>.value(value: _authCubit)],
      child: Scaffold(
        backgroundColor: AppColors.primaryGreen,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quran.png"),
            const SizedBox(height: 22),
            const QuranText.headingXlBold(text: "Hafiz"),
            const SizedBox(
              height: 16,
            ),
            const QuranText.headingLRegular(
              text: "Learn Quran and Recite everyday",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  context.goNamed(AppRoutes.nrMenu);
                } else if (state is LoginFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login Failed: ${state.error}')),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.arrow_forward, size: 20),
                  label: const QuranText.bodyLRegular(
                    text: "Login With google",
                    fontFamily: 'Poppins',
                    color: AppColors.black,
                  ),
                  onPressed: () {
                    _sendAnalyticEventClick("login");
                    _authCubit.logginWithGoogle();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
