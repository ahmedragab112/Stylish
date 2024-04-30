import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/home/presentation/widgets/product_details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                      leading: IconButton.outlined(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back)),
                      title: const Text(AppStrings.productDetails),
                      actions: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 30.sp,
                        ),
                        const HorizantelSpace(16),
                      ]),
                ],
            body: const ProductDetailsBody()));
  }
}
