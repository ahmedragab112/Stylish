import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.obscureText = false});

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textFiledBoarderColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColor.textFiledBoarderColor, width: 2),
        ),
        filled: true,
        fillColor: AppColor.textFiledFilledColor,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon:suffixIcon,
      ),
      controller: controller,
    );
  }
}
