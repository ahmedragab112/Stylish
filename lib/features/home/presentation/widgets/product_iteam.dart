import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';

class ProductIteam extends StatelessWidget {
  const ProductIteam({super.key, required this.data});
  final DataEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: AppColor.primeryColor.withOpacity(.5), width: 1.5)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Expanded( 
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.r),
                      topLeft: Radius.circular(16.r)),
                  child: CustomNetWorkImage(
                    imagePath: data.images?[0] ?? '',
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primeryColor,
                      ),
                      child: const Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.white,
                        size: 20,
                      )),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title ?? '',
                style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(4),
              Text(
                data.description ?? '',
                style: AppTextStyle.font14GreySemiBold.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(4),
              Text(
                '${data.price.toString()} EGP',
                style: AppTextStyle.font14GreySemiBold
                    .copyWith(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(4),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: data.ratingsAverage?.toDouble() ?? 0,
                    minRating: .5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 12.sp,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (double value) {},
                  ),
                  const HorizantelSpace(4),
                  Text('(${data.ratingsQuantity.toString()})',
                      style: AppTextStyle.font12RegularPrimery
                          .copyWith(color: Colors.black)),
                  const Spacer(),
                  Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primeryColor,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      )),
                ],
              ),
            ],
          ).setAllPadding(8)
        ],
      ),
    );
  }
}
