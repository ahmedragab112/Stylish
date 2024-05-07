import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/layout/app_layout.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_network_image.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/loading_effect.dart';
import 'package:stylehub/features/home/presentation/widgets/product_iteam.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetSpacificBrandError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is GetSpacificBrandLoading ||
              state is GetProductInBrandLoading) {
            return ListView.separated(
              separatorBuilder: (context, index) => const VerticalSpace(10),
              itemBuilder: (context, index) => const LoadingEffect(),
              itemCount: 20,
            );
          } else if (state is GetProductInBrandError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: VerticalSpace(
                    20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: AppColor.primeryColor.withOpacity(.30),
                            width: 2)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CustomNetWorkImage(
                          imagePath:
                              cubit.spacificBrandDataModel?.data?.image ?? '',
                          width: double.infinity,
                          height: context.screenHeight() * .4),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: VerticalSpace(
                    20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${cubit.spacificBrandDataModel?.data?.name ?? ' '} 's Products",
                        style: AppTextStyle.font18SemiBoldPrimeryPink,
                        textAlign: TextAlign.start,
                      ),
                      const VerticalSpace(20),
                    ],
                  ),
                ),
                cubit.productInBrand == null
                    ? SliverFillRemaining(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Lottie.asset(
                                'assets/lottie/Animation - 1713658542569.json',
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const VerticalSpace(20),
                            Text(
                              'This Brand Is Empty',
                              style: AppTextStyle.font18SemiBoldPrimeryPink,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    : cubit.productInBrand!.data!.isEmpty
                        ? SliverFillRemaining(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Lottie.asset(
                                    'assets/lottie/Animation - 1713658542569.json',
                                    alignment: Alignment.center,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const VerticalSpace(20),
                                Text(
                                  'This Brand Is Empty',
                                  style: AppTextStyle.font18SemiBoldPrimeryPink,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          )
                        : SliverGrid.builder(
                            itemBuilder: (context, index) => ProductIteam(
                              data: cubit.productInBrand?.data?[index] ??
                                  DataEntity(),
                              cubit: cubit,
                            ),
                            itemCount: cubit.productInBrand?.data?.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 340.h,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                            ),
                          ),
              ],
            ).setPadding(context, horizontal: 8, vertical: 20);
          }
        },
      ),
    );
  }
}
