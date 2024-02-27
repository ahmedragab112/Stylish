import 'package:flutter/material.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.index,
      required this.controller,
      this.nextPage = true,
      required this.text});
  final int index;
  final PageController controller;
  final bool nextPage;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        nextPage
            ? controller.nextPage(
                duration: const Duration(milliseconds: 500), curve: Curves.ease)
            : controller.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
        if (index == 2 && nextPage == true) {
          await locator<CacheHelper>()
              .setInstance(data: true, key: AppStrings.cacheKeyIsVisited)
              .then(
            (value) {
              context.pushReplacementNamed(AppRoutes.signIn);
            },
          );
        }
      },
      child: Text(
        nextPage
            ? index != 2
                ? AppStrings.next
                : AppStrings.getStarted
            : text,
        style: nextPage
            ? Theme.of(context).textTheme.bodyMedium
            : Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.onBoardingDescriptionGreyColor),
      ),
    );
  }
}
