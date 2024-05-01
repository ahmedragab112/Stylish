import 'package:flutter/material.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/features/home/presentation/model/product_details_args.dart';
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
      ],
    ).setPadding(
      context,
      vertical: 10,
    );
  }
}
