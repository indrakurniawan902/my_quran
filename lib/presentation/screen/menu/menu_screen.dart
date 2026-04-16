import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/common/injection/injection.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/screen/authentication/cubit/auth_cubit.dart';
import 'package:my_quran/presentation/widget/last_read_widget.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final AuthCubit _authCubit = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthCubit>.value(value: _authCubit)],
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: const QuranText.headingMBold(
            text: "Hafiz",
            color: AppColors.primaryGreen,
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 10),
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.red,
              ),
              onPressed: () {
                _modalBottomSheetMenu();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const LastReadWidget(),
                const SizedBox(height: 20),
                const QuranText.headingMBold(
                  text: "Popular",
                  color: AppColors.black,
                ),
                const SizedBox(height: 31),
                SizedBox(
                  height: 380,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.nrQuraan, extra: "Quraan");
                          },
                          child: Container(
                            height: 160,
                            width: 163,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(23),
                                image: const DecorationImage(image: AssetImage("assets/images/bg_quran.png"))),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.nrQuraan, extra: "Listening");
                          },
                          child: Container(
                            height: 191,
                            width: 163,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(23),
                                image: const DecorationImage(image: AssetImage("assets/images/bg_listening.png"))),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.nrWaktuShalat);
                          },
                          child: Container(
                            height: 191,
                            width: 163,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(23),
                                image: const DecorationImage(image: AssetImage("assets/images/bg_test.png"))),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.nrDoa);
                          },
                          child: Container(
                            height: 160,
                            width: 163,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(23),
                                image: const DecorationImage(image: AssetImage("assets/images/bg_recite.png"))),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 130.0,
            color: Colors.transparent,
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: Radius.circular(20.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(child: Text('Are you sure you want to Logout?')),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.red[400]),
                                  padding: const WidgetStatePropertyAll(EdgeInsets.all(0))),
                              onPressed: () {
                                _authCubit.logoutWithGoogle(); // Perform async operation

                                context.goNamed(AppRoutes.nrLogin);
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(Colors.blue[400]),
                                  padding: const WidgetStatePropertyAll(EdgeInsets.all(0))),
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
