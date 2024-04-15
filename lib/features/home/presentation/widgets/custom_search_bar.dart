import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: TextField(
        style: AppTextStyle.font14GreySemiBold,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          hintText: AppStrings.searchForYourBrand,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
