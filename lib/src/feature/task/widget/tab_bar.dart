import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';

class TabBarItem extends StatelessWidget {
  final String text;
  const TabBarItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: AppColors.primary200)),
      child: Padding(
        padding: const EdgeInsets.only(top: 3, right: 8, bottom: 4, left: 8),
        child: Text(text, style: AppStyle.headingH216Medium),
      ),
    );
  }
}
