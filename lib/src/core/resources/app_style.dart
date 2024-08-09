import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';

class AppStyle {
  static TextStyle captionC114Regular = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.blackColor);
  static TextStyle captionC410Regular = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.text600);
  static TextStyle textP212Mediumn = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textLinkColor);
  static TextStyle headingH216Medium = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primary500);

  static TextStyle headingH118SemiBold = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.text600);
  static TextStyle textP410Medium = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.text700);
  static TextStyle text900 =
      const TextStyle(fontWeight: FontWeight.w700, fontSize: 10,color: AppColors.text900);
}
