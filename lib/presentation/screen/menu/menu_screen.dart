import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_quran/presentation/navigation/app_router.dart';
import 'package:my_quran/presentation/navigation/app_routes.dart';
import 'package:my_quran/presentation/widget/last_read_widget.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        centerTitle: true,
        title: const QuranText.headingMBold(
          text: "Hafiz",
          color: AppColors.primaryGreen,
        ),
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
                          context.pushNamed(AppRoutes.nrHome);
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
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/bg_quran.png"))),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {},
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
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/bg_listening.png"))),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        onTap: () {},
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
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/bg_test.png"))),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {},
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
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/bg_recite.png"))),
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
    );
  }
}
