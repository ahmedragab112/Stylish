import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/product_details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              leading: IconButton(
                  autofocus: true,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.primeryColor,
                  )),
              title: const Text(AppStrings.productDetails),
              actions: [
                IconButton(
                  icon: Icon(Icons.add_shopping_cart_rounded,
                      size: 30.sp, color: AppColor.primeryColor),
                  onPressed: () async {
                    await context
                        .read<HomeCubit>()
                        .addToCart(productId: id);
                  },
                ),
                const HorizantelSpace(16),
              ]),
        ],
        body: const ProductDetailsBody(),
      ),
    );
  }
}
