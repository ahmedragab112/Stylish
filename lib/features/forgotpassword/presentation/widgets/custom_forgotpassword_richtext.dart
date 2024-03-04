import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class ForgotPasswordRichText extends StatelessWidget {
  const ForgotPasswordRichText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(text: "* ", style: AppTextStyle.font12RegularPrimery),
        TextSpan(
            text: text,
            style: AppTextStyle.font12RegularPrimery.copyWith(
              color: AppColor.greyColor,
            )),
      ]),
    );
  }
}
