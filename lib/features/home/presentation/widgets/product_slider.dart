import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/product_slider_iteam.dart';

import '../../../../core/utils/spaceing/spaceing.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key, required this.data, required this.cubit});
  final DataEntity? data;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return VerticalSpace(
      300.h,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CarouselSlider(
              items: data?.images
                  ?.map((e) => SliderItem(
                        imagePath: e,
                        length: data?.images?.length ?? 0,
                        index: cubit.activeProductIndex,
                      ))
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  cubit.changeProductSliderIndex(index);
                },
                viewportFraction: 1,
                autoPlay: true,
                scrollDirection: Axis.horizontal,
              ));
        },
      ),
    ).setOnlyPadding(context, right: 6, left: 16);
  }
}
