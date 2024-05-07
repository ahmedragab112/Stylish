import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stylehub/core/utils/animation/shimmer_effect.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: darkBackGroundColor,
      child: Container(
        width: 120.w,
        height: 120.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(.1)),
      ),
    );
  }
}