import 'package:flutter/material.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';

class HomeIntroBody extends StatelessWidget {
  const HomeIntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppStrings.youAuthSuccess,
          style: AppTextStyle.font36BoldBlack.copyWith(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(14),
        Text(
          AppStrings.findItHere,
          style: AppTextStyle.font14GreySemiBold,
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(44),
        CustomButton(
          text: AppStrings.getStarted,
          onTap: () async {
            await locator<CacheHelper>()
                .setBool(AppStrings.homeIntroVisited, true)
                .then((value) {
              context.pushReplacementNamed(AppRoutes.home);
            });
          },
        )
      ],
    ).setPadding(context, vertical: 34, horizontal: 38);
  }
}
