import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.popularProducts,
      style:
          AppTextStyle.font18SemiBoldPrimeryPink.copyWith(color: Colors.black),
    );
  }
}
