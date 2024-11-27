import 'package:flutter/material.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(27),
              height: 170,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_stack_home.png")),
                  borderRadius: BorderRadius.all(Radius.circular(23))),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: QuranText.headingMBold(
                      text: "Quran",
                      color: AppColors.primaryGreen,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      height: 36,
                      width: 36,
                      decoration:
                          BoxDecoration(color: AppColors.secondaryGreen),
                      child: Center(child: Text((index + 1).toString())),
                    ),
                    title: Text("Nama Surat"),
                    subtitle: Text("Arti"),
                  );
                },
                itemCount: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
