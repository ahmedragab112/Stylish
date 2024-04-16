import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';

import '../../data/models/get_user_wishlist_model.dart';

class WishListIteam extends StatelessWidget {
  const WishListIteam({super.key, required this.userWishList});
  final Data userWishList;
  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.primeryColor, width: .5),
      ),
      width: double.infinity,
      height: 130.h,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CustomNetWorkImage(
              height: double.infinity,
              imagePath: userWishList.imageCover ?? "",
              width: 80.w,
            ),
          ),
          const HorizantelSpace(10),
          HorizantelSpace(
            160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userWishList.title ?? "",
                  style: AppTextStyle.font18SemiBoldPrimeryPink,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomNetWorkImage(
                      imagePath: userWishList.brand?.image ?? "",
                      width: 20,
                      height: 20,
                    ),
                    const HorizantelSpace(10),
                    Text(
                      userWishList.category?.name ?? "",
                      style: AppTextStyle.font12RegularPrimery
                          .copyWith(fontSize: 14.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  "${userWishList.price} EGP",
                  style: AppTextStyle.font18SemiBoldPrimeryPink,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ).setPadding(context, vertical: 15),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    await context
                        .read<HomeCubit>()
                        .deleteWishList(productId: userWishList.id!)
                        .then((value) =>
                            context.read<HomeCubit>().getLoggedUserWishList());
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: AppColor.primeryColor,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColor.primeryColor,
                  ),
                  padding: EdgeInsets.all(6.sp),
                  alignment: Alignment.center,
                  child: Text(
                    'Add to Cart',
                    style: AppTextStyle.font14GreySemiBold
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ).setOnlyPadding(context, top: 8, bottom: 8, right: 8),
          ),
        ],
      ),
    );
  }
}
