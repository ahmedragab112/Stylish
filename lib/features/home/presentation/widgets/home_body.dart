import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/categores.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:stylehub/features/home/presentation/widgets/home_slider.dart';
import 'package:stylehub/features/home/presentation/widgets/product_iteam.dart';
import 'package:stylehub/features/home/presentation/widgets/slider_indecator.dart';
import 'package:stylehub/features/home/presentation/widgets/sort_and_filter.dart';

import 'custom_appbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: VerticalSpace(10),
        ),
        const SliverToBoxAdapter(
          child: CustomAppBar(),
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        const SliverToBoxAdapter(
          child: CustomSearchBar(),
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        const SliverToBoxAdapter(
          child: HomeSlider(),
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(12),
        ),
        const SliverToBoxAdapter(
          child: SliderIndecator(),
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        const SliverToBoxAdapter(
          child: SortAndFilter(),
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        const SliverToBoxAdapter(
          child: CategoresList(),
        ),
        const SliverToBoxAdapter(
          child: VerticalSpace(12),
        ),
        SliverGrid.builder(
            itemCount: cubit.productEntity?.data?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 340.h,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemBuilder: (context, index) =>
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return ProductIteam(
                      imagePath: cubit.productEntity?.data?[index].images?[0] ??
                          'https://th.bing.com/th/id/OIP.C9Hk-iAjCOAmb0w-9d7pIgHaGw?w=159&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                      ratingAverage: double.parse(
                          (cubit.productEntity?.data?[index].ratingsAverage ??
                                  0)
                              .toString()),
                      productTitle:
                          cubit.productEntity?.data?[index].title ?? '',
                      productDescription:
                          cubit.productEntity?.data?[index].description ?? '',
                      productPrice:
                          (cubit.productEntity?.data?[index].price ?? 0)
                              .toString(),
                      ratingsQuantity: int.parse(
                          (cubit.productEntity?.data?[index].ratingsQuantity ??
                                  0)
                              .toString()),
                    );
                  },
                )),
      ],
    ).setPadding(context, horizontal: 16);
  }
}
