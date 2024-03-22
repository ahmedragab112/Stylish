import 'package:flutter/material.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/widgets/categores.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:stylehub/features/home/presentation/widgets/home_slider.dart';
import 'package:stylehub/features/home/presentation/widgets/slider_indecator.dart';
import 'package:stylehub/features/home/presentation/widgets/sort_and_filter.dart';

import 'custom_appbar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: VerticalSpace(10),
        ),
        SliverToBoxAdapter(
          child: CustomAppBar(),
        ),
        SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        SliverToBoxAdapter(
          child: CustomSearchBar(),
        ),
        SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        SliverToBoxAdapter(
          child: SortAndFilter(),
        ),
        SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        SliverToBoxAdapter(
          child: CategoresList(),
        ),
        SliverToBoxAdapter(
          child: VerticalSpace(16),
        ),
        SliverToBoxAdapter(
          child: HomeSlider(),
        ),
        SliverToBoxAdapter(
          child: VerticalSpace(12),
        ),
        SliverToBoxAdapter(
          child: SliderIndecator(),
        ),
        
      ],
    ).setPadding(context, horizontal: 16);
  }
}
