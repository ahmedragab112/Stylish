import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/add_to_cart_and_check_out.dart';
import 'package:stylehub/features/home/presentation/widgets/loading_effect.dart';
import 'package:stylehub/features/home/presentation/widgets/loading_product_details.dart';
import 'package:stylehub/features/home/presentation/widgets/product_details_body_modual.dart';
import 'package:stylehub/features/home/presentation/widgets/product_slider.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetSpacificIteamLoading) {
          return Column(
            children: [
              const LoadingProductDetails(),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const VerticalSpace(10),
                  itemBuilder: (context, index) => const LoadingEffect(),
                  itemCount: 20,
                ),
              ),
            ],
          );
        } else if (state is GetSpacificIteamError) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              ProductSlider(),
              ProductDetailsBodyModual(),
              VerticalSpace(48),
              AddToCartAndCheckOut()
            ],
          ),
        );
      },
    );
  }
}
