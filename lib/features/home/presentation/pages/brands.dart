import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:stylehub/core/error/errors.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/bran_iteam.dart';
import 'package:stylehub/features/home/presentation/widgets/home_listener.dart';

class BrandsBody extends StatelessWidget {
  const BrandsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return RefreshIndicator(
      color: AppColor.primeryColor,
      onRefresh: () async {
        await cubit.getAllBrand();
      },
      child: CustomScrollView(
        slivers: [
          BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is GetAllBrandsLoaded ||
                  current is GetAllBrandsError ||
                  current is GetAllBrandsLoading,
              builder: (context, state) {
                if (state is GetAllBrandsLoading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primeryColor,
                      ),
                    ),
                  );
                } else if (state is GetAllBrandsError) {
                  return SliverFillRemaining(
                    child: state.error == ApiErrors.defaultError
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/lottie/Animation - 1713658542569.json',
                                  width: double.infinity,
                                ),
                                const VerticalSpace(20),
                                const Text(
                                    'Check internet connection and try again'),
                              ],
                            ),
                          )
                        : Center(child: Text(state.error)),
                  );
                } else {
                  return SliverGrid.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return BrandIteam(
                          data: cubit.brands?.data?[index]??Data() );
                    },
                    itemCount: cubit.brands?.data?.length ?? 0,
                  );
                }
              }),
          const SliverToBoxAdapter(child: HomeListener())
        ],
      ),
    );
  }
}
