import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/widgets/cart_iteam.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.separated(
          itemBuilder: (context, index) => const ProductCartIteam(),
          separatorBuilder: (context, index) => const VerticalSpace(20),
          itemCount: 20,
        ),
      ],
    );
  }
}
