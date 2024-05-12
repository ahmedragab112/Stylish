import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/model/category_product_argument_model.dart';
import 'package:stylehub/features/home/presentation/widgets/category_iteam.dart';

class CategoresList extends StatelessWidget {
  const CategoresList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.all(8.sp),
      alignment: Alignment.center,
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: AppColor.primeryColor.withOpacity(.5), width: .5)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeCategoryLoaded ||
            current is HomeCategoryError ||
            current is HomeCategoryLoading,
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          if (state is HomeCategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primeryColor,
              ),
            );
          } else if (state is HomeCategoryError) {
            return Center(
              child: Text(
                state.error,
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () async {
                  await cubit
                      .getProductInCategory(
                          categoryId: cubit.category?.data?[index].sId ?? '')
                      .then((value) => context.pushNamed(
                          AppRoutes.categoryIteamPage,
                          arguments: CaterogyProductArgumentModel(
                              categoryName:
                                  cubit.category?.data?[index].name ?? '',
                              cubit: cubit)));
                },
                child: CategoryIteam(
                  image: cubit.category?.data?[index].image ?? '',
                  text: cubit.category?.data?[index].name ?? '',
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const HorizantelSpace(16),
              itemCount: cubit.category?.data?.length ?? 0,
            );
          }
        },
      ),
    );
  }
}
