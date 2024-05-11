import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/data/models/get_logged_user_cart.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/add_to_cart_button.dart';
import 'package:stylehub/features/home/presentation/widgets/cart_iteam.dart';
import 'package:stylehub/features/home/presentation/widgets/home_listener.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        await cubit.getLoggedUserCartData();
      },
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is GetLoggedUserDataLoaded,
                  builder: (context, state) {
                    return SliverToBoxAdapter(
                      child: FadeInUpBig(
                        child: Text(
                          'Total Cart  Items : ${cubit.cartCount}',
                          style: AppTextStyle.font18SemiBoldPrimeryPink
                              .copyWith(color: Colors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    );
                  },
                ),
                const SliverToBoxAdapter(
                  child: VerticalSpace(20),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is AddToCartLoading) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is AddToCartError) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(state.error),
                        ),
                      );
                    } else {
                      return cubit.cartCount == 0
                          ? SliverFillRemaining(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Lottie.asset(
                                        'assets/lottie/Animation - 1713658542569.json',
                                        alignment: Alignment.center,
                                        fit: BoxFit.fill),
                                  ),
                                  const VerticalSpace(20),
                                  Text(
                                    'Your Cart is Empty Add Products',
                                    style:
                                        AppTextStyle.font18SemiBoldPrimeryPink,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )
                          : SliverList.separated(
                              itemBuilder: (context, index) => index.isEven
                                  ? FadeInLeftBig(
                                      child: ProductCartIteam(
                                        product: cubit.cartData!.data!
                                                .products![index].product ??
                                            Product(),
                                        price: (cubit.cartData!.data!
                                                    .products![index].price ??
                                                0)
                                            .toString(),
                                        count: int.parse((cubit.cartData!.data!
                                                    .products![index].count ??
                                                0)
                                            .toString()),
                                      ),
                                    )
                                  : FadeInRightBig(
                                      child: ProductCartIteam(
                                        product: cubit.cartData!.data!
                                                .products![index].product ??
                                            Product(),
                                        price: (cubit.cartData!.data!
                                                    .products![index].price ??
                                                0)
                                            .toString(),
                                        count: int.parse((cubit.cartData!.data!
                                                    .products![index].count ??
                                                0)
                                            .toString()),
                                      ),
                                    ),
                              itemCount:
                                  cubit.cartData?.data?.products?.length ?? 0,
                              separatorBuilder: (context, index) =>
                                  const VerticalSpace(24),
                            );
                    }
                  },
                ),
                const SliverToBoxAdapter(child: HomeListener()),
                const SliverToBoxAdapter(child: VerticalSpace(20)),
              ],
            ),
          ),
          Row(
            children: [
              BounceInRight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total price ',
                      style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                          color: AppColor.primeryColor.withOpacity(.60)),
                    ),
                    const VerticalSpace(10),
                    BlocBuilder<HomeCubit, HomeState>(
                      buildWhen: (previous, current) =>
                          current is GetLoggedUserDataLoaded ||
                          current is GetLoggedUserDataError ||
                          current is GetLoggedUserDataLoading,
                      builder: (context, state) {
                        return Text(
                          'EGP ${cubit.totalPrice.toInt().toString()}',
                          style: AppTextStyle.font18SemiBoldPrimeryPink
                              .copyWith(fontWeight: FontWeight.w500),
                        );
                      },
                    )
                  ],
                ),
              ),
              const HorizantelSpace(30),
              BounceInLeft(
                child: const Expanded(
                  child: AddToCartButton(
                    text: 'Check Out',
                    icon: Icons.arrow_right_alt_rounded,
                  ),
                ),
              ),
            ],
          ),
        ],
      ).setPadding(context, horizontal: 8, vertical: 20),
    );
  }
}
