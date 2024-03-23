import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';

class ProductIteam extends StatelessWidget {
  const ProductIteam(
      {super.key,
      required this.imagePath,
      required this.ratingAverage,
      required this.productTitle,
      required this.productDescription,
      required this.productPrice,
      required this.ratingsQuantity});
  final String imagePath;
  final double ratingAverage;
  final String productTitle;
  final String productDescription;
  final String productPrice;
  final int ratingsQuantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CustomNetWorkImage(
                imagePath: imagePath,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productTitle,
                style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(4),
              Text(
                productDescription,
                style: AppTextStyle.font12RegularPrimery
                    .copyWith(color: Colors.black, fontSize: 10.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),  
              const VerticalSpace(4),
              Text(
                productPrice,
                style: AppTextStyle.font12RegularPrimery
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(4),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: ratingAverage,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 12.sp,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {},
                  ),
                  const HorizantelSpace(4),
                  Text(ratingsQuantity.toString(),
                      style: AppTextStyle.font10RegularGrey),
                ],
              ),
            ],
          ).setAllPadding(8)
        ],
      ),
    );
  }
}
