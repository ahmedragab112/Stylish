import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/home_listener.dart';
import 'package:stylehub/features/home/presentation/widgets/wish_list_iteam.dart';
import '../../data/models/get_user_wishlist_model.dart';

class WishListBody extends StatelessWidget {
  const WishListBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        await cubit.getLoggedUserWishList();
      },
      child: CustomScrollView(
        slivers: [
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) => current is GetUserWishListLoaded,
            builder: (context, state) {
              return SliverToBoxAdapter(
                child: Text(
                  'Total Wish List Items : ${cubit.wishlistCount}',
                  style: AppTextStyle.font18SemiBoldPrimeryPink
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.start,
                ),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: VerticalSpace(20),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is AddToWishListLoading) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is AddToWishListError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.error),
                  ),
                );
              } else {
                return cubit.wishlistCount== 0
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
                              'Your Wish List is Empty Add Products',
                              style: AppTextStyle.font18SemiBoldPrimeryPink,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    : SliverList.separated(
                        itemBuilder: (context, index) => WishListIteam(
                          userWishList: cubit.getUserWishList?.data?[index]?? Data(),
                        ),
                        itemCount: cubit.getUserWishList?.data?.length??0,
                        separatorBuilder: (context, index) =>
                            const VerticalSpace(24),
                      );
              }
            },
          ),
          const SliverToBoxAdapter(child: HomeListener())
        ],
      ).setPadding(context, horizontal: 8, vertical: 20),
    );
  }
}
