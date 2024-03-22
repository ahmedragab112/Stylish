import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/category_iteam.dart';

class CategoresList extends StatelessWidget {
  const CategoresList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeCategoryLoaded || current is HomeCategoryError,
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CategoryIteam(
              image: cubit.category?.data?[index].image ?? '',
              text: cubit.category?.data?[index].name ?? '',
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const HorizantelSpace(16),
            itemCount: cubit.category?.data?.length ?? 0,
          );
        },
      ),
    );
  }
}
