import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class SliderIteam extends StatelessWidget {
  const SliderIteam(
      {super.key,
      required this.image,
      required this.descount,
      required this.text,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.alignment = Alignment.centerLeft,
      this.color = AppColor.darkBlueTextColor});

  final String image;
  final String descount;
  final CrossAxisAlignment crossAxisAlignment;
  final String text;
  final AlignmentGeometry? alignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 36.h),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            descount,
            style: AppTextStyle.font20SemiBoldWhite
                .copyWith(color: color, fontWeight: FontWeight.bold),
          ),
          const VerticalSpace(8),
          Text(
            text,
            style: AppTextStyle.font20SemiBoldWhite
                .copyWith(color: color, fontWeight: FontWeight.bold),
          ),
          const VerticalSpace(8),
          Container(
            width: 100.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.darkBlue,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              AppStrings.shopNow,
              style: AppTextStyle.font14GreySemiBold
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
