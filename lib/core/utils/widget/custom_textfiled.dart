import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.obscureText = false,
      this.validator});

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textFiledBoarderColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textFiledBoarderColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textFiledBoarderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColor.textFiledBoarderColor, width: 1),
        ),
        filled: true,
        fillColor: AppColor.textFiledFilledColor,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
    );
  }
}
