
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      this.helperText,
      this.obscureText = false,
      this.suffixIcon,
      required this.lableText,
      this.keyboardType = TextInputType.emailAddress,
      required this.controller,
      required this.validator});
  final String? helperText;
  final bool? obscureText;
  final String lableText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      validator: validator,
      style: AppTextStyle.font14GreySemiBold.copyWith(color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(
          lableText,
          style: AppTextStyle.font12RegularPrimery,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide:  BorderSide(color: AppColor.primeryColor.withOpacity(.30)),
        ),
        helperText: helperText,
      ),
    ).setOnlyPadding(context, left: 8.w);
  }
}
