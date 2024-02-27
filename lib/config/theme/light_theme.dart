import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      bodySmall: AppTextStyle.font14GreySemiBold,
      bodyMedium: AppTextStyle.font18SemiBoldPrimeryPink,
      bodyLarge: AppTextStyle.font24ExtraBoldBlack,
    ),
  );
}
