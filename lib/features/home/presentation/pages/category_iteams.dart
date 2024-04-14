import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/product_iteam.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = ModalRoute.of(context)!.settings.arguments as HomeCubit;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  Text(
                    cubit.productInCategory?.data?[0].category?.name  ?? '',
                    style: AppTextStyle.font24ExtraBoldBlack
                        .copyWith(color: AppColor.primeryColor),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SliverGrid.builder(
              itemBuilder: (context, index) => ProductIteam(
                data: cubit.productInCategory!.data![index],
              ),
              itemCount: cubit.productInCategory?.data?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 340.h,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
            ),
          ],
        ).setPadding(context, horizontal: 16, vertical: 8),
      ),
    );
  }
}
