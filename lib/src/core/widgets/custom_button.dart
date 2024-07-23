import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  
  const CustomButton({super.key, required this.text, this.onTap});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),

          color: AppColors.primary500
        ),
        child: Center(
          child: Text(widget.text,style: AppStyle.captionC114Regular.copyWith(color: AppColors.whiteColor)),
        ),
      ),
    );
  }
}