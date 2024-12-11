import 'package:flutter/material.dart';
import 'package:my_quran/utils/typography.dart';
import 'package:my_quran/utils/colors.dart';

class QuranText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final String? fontFamily;

  /// MOBILE STYLES
  const QuranText.headingXlBold(
      {super.key,
      required this.text,
      this.textStyle = AppTextStyles.headersH1,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.color = AppColors.secondaryGreen,
      this.fontFamily});

  const QuranText.headingLRegular(
      {super.key,
      required this.text,
      this.textStyle = AppTextStyles.headersH2,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.color = AppColors.black,
      this.fontFamily});
  const QuranText.headingMBold(
      {super.key,
      required this.text,
      this.textStyle = AppTextStyles.headersH3,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.color = AppColors.black,
      this.fontFamily});
  const QuranText.headingArabicLBold(
      {super.key,
      required this.text,
      this.textStyle = AppTextStyles.headersArabicP1,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.color = AppColors.black,
      this.fontFamily});
  const QuranText.bodyLRegular(
      {super.key,
      required this.text,
      this.textStyle = AppTextStyles.bodyP1,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.color = AppColors.black,
      this.fontFamily});
  const QuranText.bodyMRegular(
      {super.key,
      required this.text,
      this.textStyle = AppTextStyles.bodyP2,
      this.overflow,
      this.maxLines,
      this.textAlign,
      this.color = AppColors.black,
      this.fontFamily});

  // const QuranText.mobileHeadingLBold({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileHeadingLBold,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.primaryBlue,
  // }) : super(key: key);

  // const QuranText.mobileHeadingMBold({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileHeadingMBold,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.primaryBlue,
  // }) : super(key: key);

  // const QuranText.mobileHeadingSBold({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileHeadingSBold,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.primaryBlue,
  // }) : super(key: key);

  // const QuranText.mobileHeadingXsBold({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileHeadingXsBold,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.primaryBlue,
  // }) : super(key: key);

  // const QuranText.mobileBodyMMedium({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileBodyMMedium,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.primaryBlue,
  // }) : super(key: key);

  // const QuranText.mobileBodyMRegular({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileBodyMRegular,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.extendedPrimaryBlue40,
  // }) : super(key: key);

  // const QuranText.mobileBodySSemiBold({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileBodySSemiBold,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.extendedPrimaryBlue40,
  // }) : super(key: key);

  // const QuranText.mobileBodySMedium({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileBodySMedium,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.extendedPrimaryBlue40,
  // }) : super(key: key);

  // const QuranText.mobileBodySRegular({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileBodySRegular,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.neutralGrey80,
  // }) : super(key: key);

  // const QuranText.mobileLabelSemiBold({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileLabelSemiBold,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.extendedPrimaryBlue40,
  // }) : super(key: key);

  // const QuranText.mobileLabelRegular({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileLabelRegular,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.extendedPrimaryBlue40,
  // }) : super(key: key);

  // const QuranText.mobileUnderlineTextMMedium({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileUnderlineTextMMedium,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.primaryBlue,
  // }) : super(key: key);

  // const QuranText.mobileUnderlineTextSBold({
  //   Key? key,
  //   required this.text,
  //   this.textStyle = AppTextStyles.mobileUnderlineTextSBold,
  //   this.overflow,
  //   this.maxLines,
  //   this.textAlign,
  //   this.color = AppColors.primaryBlue,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
      style: textStyle?.copyWith(
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
