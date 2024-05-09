import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_icon.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';
import 'package:stylehub/features/home/data/models/get_logged_user_cart.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';

class ProductCartIteam extends StatelessWidget {
  const ProductCartIteam(
      {super.key,
      required this.product,
      required this.price,
      required this.count});
  final Product product;
  final String price;
  final int count;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.productDetails, arguments: product.id);
      },
      child: Container(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CustomNetWorkImage(
                  imagePath: product.imageCover ?? '',
                  width: 120.w,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title ?? '',
                          style: AppTextStyle.font18SemiBoldPrimeryPink,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                context.pushNamed(AppRoutes.brandProduct,
                                    arguments: product.brand!.sId);
                              },
                              child: CircleAvatar(
                                radius: 15.r,
                                child: CustomNetWorkImage(
                                  imagePath: product.brand?.image ?? '',
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            const HorizantelSpace(5),
                            HorizantelSpace(
                              65,
                              child: Text(
                                product.brand?.name ?? '',
                                style: AppTextStyle.font14GreySemiBold,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const HorizantelSpace(5),
                          ],
                        ),
                        Text(
                          '$price EGP',
                          style: AppTextStyle.font18SemiBoldPrimeryPink,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  const HorizantelSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await cubit.deleteCartIteam(productId: product.id!);
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 25,
                            color: AppColor.primeryColor,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 10.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.primeryColor,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIcon(
                                onTap: () async {
                                  var afterDecreement =
                                      cubit.decreementProductCartCount(count);
                                  if (afterDecreement == 0) {
                                    return;
                                  }
                                  await cubit.updateCartIteam(
                                    productId: product.id!,
                                    count: afterDecreement,
                                  );
                                },
                                icon: Icons.remove,
                              ),
                              Text(
                                count.toString(),
                                style: AppTextStyle.font20SemiBoldWhite
                                    .copyWith(color: Colors.white),
                              ),
                              CustomIcon(
                                onTap: () async {
                                  var afterIncreement =
                                      cubit.increementProductCartCount(
                                          int.parse((product.quantity ?? 0)
                                              .toString()),
                                          count);
                                  if (afterIncreement > product.quantity!) {
                                    return;
                                  }
                                  await cubit.updateCartIteam(
                                    productId: product.id!,
                                    count: afterIncreement,
                                  );
                                },
                                icon: Icons.add,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).setPadding(context, vertical: 8, horizontal: 8),
            )
          ],
        ),
      ),
    );
  }
}
