import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/widgets/product_shimmer.dart';

class LoadingProductDetails extends StatelessWidget {
  const LoadingProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalSpace(
      200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ProductShimmer(),
        separatorBuilder: (context, index) => const VerticalSpace(10),
        itemCount: 10,
      ),
    );
  }
}
