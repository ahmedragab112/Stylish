import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/onboarding/manager/onboarding_cubit.dart';
import 'package:stylehub/features/onboarding/widgets/inboarding_appbar.dart';
import 'package:stylehub/features/onboarding/widgets/page_viewbody.dart';

class CustomPageViewWidget extends StatelessWidget {
  const CustomPageViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var bloc = context.read<OnboardingCubit>();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InBoardingAppBar(
              index: bloc.index,
            ),
            const VerticalSpace(110),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: bloc.controller,
                itemBuilder: (context, index) => PageViewBody(
                  data: bloc.pages[index],
                ),
                itemCount: bloc.pages.length,
                onPageChanged: bloc.onPageChanged,
              ),
            ),
          ],
        ).setPadding(context, horizontal: 16.w, vertical: 22.h);
      },
    );
  }
}
