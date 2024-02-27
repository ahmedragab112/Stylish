import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/onboarding/manager/onboarding_cubit.dart';

class InBoardingAppBar extends StatelessWidget {
  const InBoardingAppBar({super.key, });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<OnboardingCubit, OnboardingState>(

          builder: (context, state) {
            var bloc = context.read<OnboardingCubit>();
            return RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: '${bloc.index + 1}',
                  style: AppTextStyle.font18SemiBoldPrimeryPink
                      .copyWith(color: Colors.black)),
              TextSpan(
                  text: '/3',
                  style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                      color: AppColor.onBoardingDescriptionGreyColor)),
            ]));
          },
        ),
        GestureDetector(
          onTap: () async {
            await locator<CacheHelper>()
                .setInstance(data: true, key: AppStrings.cacheKeyIsVisited)
                .then((value) {
              context.pushReplacementNamed(AppRoutes.signIn);
            });
          },
          child: const Text(
            AppStrings.skip,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
