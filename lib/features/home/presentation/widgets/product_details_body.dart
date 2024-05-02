import 'package:flutter/material.dart';
import 'package:stylehub/core/extentions/extention.dart';
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProductSlider(
            cubit: args.cubit,
            data: args.data,
          ),
        ),
        SliverToBoxAdapter(
          child: ProductDetailsBodyModual(
            cubit: args.cubit,
            data: args.data,
          ),
        ),
        const SliverToBoxAdapter(child: VerticalSpace(48)),
        SliverToBoxAdapter(
            child: AddToCartAndCheckOut(
          data: args.data,
        ))
      ],
    ).setPadding(
      context,
      vertical: 10,
    );
  }
}
