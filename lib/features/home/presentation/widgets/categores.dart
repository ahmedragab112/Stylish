import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/widgets/category_iteam.dart';

class CategoresList extends StatelessWidget {
  const CategoresList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CategoryIteam(),
        separatorBuilder: (BuildContext context, int index) =>
            const HorizantelSpace(16),
        itemCount: 100,
      ),
    );
  }
}
