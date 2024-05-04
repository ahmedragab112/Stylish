import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/model/product_details_args.dart';
import 'package:stylehub/features/home/presentation/widgets/add_to_cart_and_check_out.dart';
import 'package:stylehub/features/home/presentation/widgets/product_details_body_modual.dart';
import 'package:stylehub/features/home/presentation/widgets/product_slider.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.args});

  final ProductDetailsArgs args;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductSlider(
          cubit: args.cubit,
          data: args.data,
        ),
        ProductDetailsBodyModual(
          cubit: args.cubit,
          data: args.data,
        ),
        const VerticalSpace(48),
        AddToCartAndCheckOut(
          data: args.data,
        )
      ],
    );
  }
}
