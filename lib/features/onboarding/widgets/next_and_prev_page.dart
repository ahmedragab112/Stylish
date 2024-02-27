import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/onboarding/manager/onboarding_cubit.dart';
import 'package:stylehub/features/onboarding/widgets/custom_text.dart';

class NextAndPrevPage extends StatelessWidget {
  const NextAndPrevPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var bloc = context.read<OnboardingCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bloc.index == 0
                ? const SizedBox.shrink()
                : CustomText(
                    index: bloc.index,
                    controller: bloc.controller,
                    text: AppStrings.prev,
                    nextPage: false,
                  ),
            SmoothPageIndicator(
              controller: bloc.controller,
              count: bloc.pages.length,
              textDirection: TextDirection.ltr,
              effect: ExpandingDotsEffect(
                  dotColor: AppColor.darkBlue.withOpacity(.20),
                  activeDotColor: AppColor.darkBlue,
                  dotHeight: 10.h,
                  dotWidth: 10.w),
            ),
            CustomText(
              index: bloc.index,
              controller: bloc.controller,
              text: AppStrings.prev,
            )
          ],
        );
      },
    );
  }
}
