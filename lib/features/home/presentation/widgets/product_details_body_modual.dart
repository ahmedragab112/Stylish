import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/quantity_and_rating.dart';
import 'package:stylehub/features/home/presentation/widgets/title_and_price.dart';

class ProductDetailsBodyModual extends StatelessWidget {
  const ProductDetailsBodyModual({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(16),
        Text(
          cubit.spacificIteamModel?.data?.title ?? '',
          style: AppTextStyle.font24ExtraBoldBlack,
        ),
        const VerticalSpace(16),
        TitleAndPrice(
          title: cubit.spacificIteamModel?.data?.brand?.name ?? '',
          price: 'EGP  ${cubit.spacificIteamModel?.data?.price.toString()}',
          brandImage: cubit.spacificIteamModel?.data?.brand?.image ??
              'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?size=626&ext=jpg',
          brandId: cubit.spacificIteamModel?.data?.brand?.sId ?? '',
        ),
        const VerticalSpace(16),
        QuantityAndRating(
          quntity: cubit.spacificIteamModel?.data?.quantity.toString() ?? '',
          rating: double.parse(
              (cubit.spacificIteamModel?.data?.ratingsAverage ?? 0).toString()),
        ),
        const VerticalSpace(16),
        Text(
          AppStrings.description,
          style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const VerticalSpace(8),
        SizedBox(
          width: double.infinity,
          child: ReadMoreText(
            cubit.spacificIteamModel?.data?.description ?? '',
            colorClickableText: AppColor.blueColor,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.start,
            trimCollapsedText: 'Read more',
            trimExpandedText: '...Show less',
            style: AppTextStyle.font14GreySemiBold
                .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ],
    ).setPadding(context, horizontal: 16);
  }
}
