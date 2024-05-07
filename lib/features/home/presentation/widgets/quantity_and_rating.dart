import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class QuantityAndRating extends StatelessWidget {
  const QuantityAndRating({
    super.key,
    required this.quntity,
    required this.rating,
  });
  final String quntity;

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
                color: AppColor.primeryColor.withOpacity(.30), width: 1),
          ),
          child: Text(
            '$quntity Avaliable',
            style: AppTextStyle.font18SemiBoldPrimeryPink
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const HorizantelSpace(16),
        const Icon(
          Icons.star,
          color: Color(0xffF4B400),
          size: 15,
        ),
        const HorizantelSpace(4),
        Text('$rating ', style: AppTextStyle.font18SemiBoldPrimeryPink),
        const HorizantelSpace(20),
      ],
    );
  }
}
