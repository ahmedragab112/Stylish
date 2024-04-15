import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';

class CategoryIteam extends StatelessWidget {
  const CategoryIteam({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CustomNetWorkImage(
            height: 100.h,
            imagePath: image,
            width: 100.w,
          ),
        ),
        const VerticalSpace(4),
        Text(
          text,
          style: AppTextStyle.font18SemiBoldPrimeryPink,
        ),
      ],
    );
  }
}
