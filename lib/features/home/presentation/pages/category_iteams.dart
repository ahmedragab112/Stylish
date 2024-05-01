import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/presentation/model/category_product_argument_model.dart';
import 'package:stylehub/features/home/presentation/widgets/product_iteam.dart';

class CategoryIteams extends StatelessWidget {
  const CategoryIteams({super.key});

  @override
  Widget build(BuildContext context) {
    CaterogyProductArgumentModel arg = ModalRoute.of(context)!
        .settings
        .arguments as CaterogyProductArgumentModel;
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
                    arg.categoryName,
                    style: AppTextStyle.font24ExtraBoldBlack
                        .copyWith(color: AppColor.primeryColor),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            arg.cubit.productInCategory!.data!.isEmpty
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
                          'This Category Is Empty',
                          style: AppTextStyle.font18SemiBoldPrimeryPink,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                : SliverGrid.builder(
                    itemBuilder: (context, index) => ProductIteam(
                      data: arg.cubit.productInCategory!.data![index],
                      cubit: arg.cubit,
                    ),
                    itemCount: arg.cubit.productInCategory?.data?.length,
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
