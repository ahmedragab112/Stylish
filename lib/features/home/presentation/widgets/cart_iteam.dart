import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_icon.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';

class ProductCartIteam extends StatelessWidget {
  const ProductCartIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: 120.h),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColor.primeryColor, width: 1),
      ),
      child: Row(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColor.primeryColor, width: 2),
            ),
            child: CustomNetWorkImage(
              imagePath:
                  'https://th.bing.com/th/id/OIP.Tl6OYOGoLgCHLMY66j8CBgHaEn?w=302&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7',
              width: 120.w,
              height: double.infinity,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoes',
                      style: AppTextStyle.font18SemiBoldPrimeryPink,
                    ),
                    Text('Men', style: AppTextStyle.font18SemiBoldPrimeryPink),
                    Text(
                      '3000 EGP',
                      style: AppTextStyle.font18SemiBoldPrimeryPink,
                    )
                  ],
                ),
                const HorizantelSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.delete_outline_rounded,
                        color: AppColor.darkBlue,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 10.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.blueColor,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIcon(
                                onTap: () {},
                                icon: Icons.remove,
                              ),
                              Text(
                                '2',
                                style: AppTextStyle.font20SemiBoldWhite
                                    .copyWith(color: Colors.white),
                              ),
                              CustomIcon(
                                onTap: () {},
                                icon: Icons.add,
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ).setPadding(context, vertical: 8, horizontal: 8),
          )
        ],
      ),
    );
  }
}
