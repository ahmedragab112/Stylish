import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class AgreeToRules extends StatelessWidget {
  const AgreeToRules({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      width: 258.w, 
      height: 30.h,
      child: RichText(
        textAlign:  TextAlign.start,
        text: TextSpan(children: [
          TextSpan(
            text: AppStrings.byClickingThe,
            style: AppTextStyle.font12RegularPrimery
                .copyWith(color: AppColor.greyPrimary),
          ),
          TextSpan(
              text: AppStrings.signup, style: AppTextStyle.font12RegularPrimery),
          TextSpan(
              text: AppStrings.youAgree,
              style: AppTextStyle.font12RegularPrimery
                  .copyWith(color: AppColor.greyPrimary))
        ]),
      ),
    );
  }
}
