import 'package:flutter/material.dart';
import 'package:my_quran/presentation/widget/quran_text.dart';
import 'package:my_quran/utils/colors.dart';

class LastReadWidget extends StatelessWidget {
  const LastReadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(27),
      height: 170,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_stack_home.png")),
          borderRadius: BorderRadius.all(Radius.circular(23))),
      child: const Stack(
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
    );
  }
}
