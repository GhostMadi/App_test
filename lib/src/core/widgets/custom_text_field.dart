import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/core/resources/app_colors.dart';
import 'package:flutter_application_2/src/core/resources/app_style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool isPrivet;
  const CustomTextField(
      {super.key,
      required this.controller,
      this.validator,
      required this.hintText,
      this.isPrivet = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

bool isShow = false;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: isShow,
        style: AppStyle.captionC114Regular,
        decoration: InputDecoration(
          labelText: widget.hintText,
          hintStyle: AppStyle.captionC410Regular,
          hintText: widget.hintText,
          labelStyle: AppStyle.captionC410Regular,
          suffixIcon: widget.isPrivet == true
              ? IconButton(
                  onPressed: () => setState(() => isShow = !isShow),
                  icon: Icon(
                      isShow
                          ? Icons.remove_red_eye_outlined
                          : CupertinoIcons.eye_slash_fill,
                      size: 16,
                      color: AppColors.text800))
              : null,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderLine)),
        ));
  }
}
