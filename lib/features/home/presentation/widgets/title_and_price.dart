import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';

import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice(
      {super.key,
      required this.title,
      required this.price,
      required this.brandImage, required this.brandId});
  final String title;
  final String price;
  final String brandImage;
  final String brandId;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                color: AppColor.blueColor,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const HorizantelSpace(20),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.brandProduct, arguments: brandId);
              },
              child: CustomNetWorkImage(
                imagePath: brandImage,
                width: 60.w,
                height: 60.h,
              ),
            )
          ],
        ),
        Text(
          price,
          style: AppTextStyle.font18SemiBoldPrimeryPink
              .copyWith(color: AppColor.blueColor, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
