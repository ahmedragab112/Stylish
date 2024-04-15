import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/onboarding/model/page_view_model.dart';
import 'package:stylehub/features/onboarding/widgets/next_and_prev_page.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({
    super.key,
    required this.data,
  });
  final PageViewModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          data.image,
          width: double.infinity,
          height: 370.h,
          fit: BoxFit.fill,
        ),
        const VerticalSpace(15),
        Text(
          data.title,
          style: AppTextStyle.font24ExtraBoldBlack,
        ),
        const VerticalSpace(10),
        Text(
          data.description,
          style: AppTextStyle.font14GreySemiBold.copyWith(
            height: 2.5,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.clip,
        ),
        const Spacer(),
        const NextAndPrevPage()
      ],
    );
  }
}
