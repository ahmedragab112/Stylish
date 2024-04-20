import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/categores.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:stylehub/features/home/presentation/widgets/home_listener.dart';
import 'package:stylehub/features/home/presentation/widgets/home_slider.dart';
import 'package:stylehub/features/home/presentation/widgets/popular_products.dart';
import 'package:stylehub/features/home/presentation/widgets/product_iteam.dart';
import 'package:stylehub/features/home/presentation/widgets/slider_indecator.dart';
import 'package:stylehub/features/home/presentation/widgets/sort_and_filter.dart';

import 'custom_appbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return RefreshIndicator(
      color: AppColor.primeryColor,
      onRefresh: () async {
        cubit
          ..getAllCategory()
          ..getAllProducts();
      },
      child: CustomScrollView(
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
          const SliverToBoxAdapter(
            child: PopularProducts(),
          ),
          const SliverToBoxAdapter( 
            child: VerticalSpace(12),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is GetAllProductLoading ||
                current is GetAllProductError ||
                current is GetAllProductLoaded,
            builder: (context, state) {
              if (state is GetAllProductLoading) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is GetAllProductError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(state.error),
                  ),
                );
              } else {
                return SliverGrid.builder(
                  itemCount: cubit.homeProducts?.data?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 340.h,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemBuilder: (context, index) => ProductIteam(
                    data: cubit.homeProducts?.data?[index] ?? DataEntity(),
                  ),
                );
              }
            },
          ),
          const SliverToBoxAdapter(child: HomeListener())
        ],
      ).setPadding(context, horizontal: 16),
    );
  }
}
