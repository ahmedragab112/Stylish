import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/quantity_and_rating.dart';
import 'package:stylehub/features/home/presentation/widgets/title_and_price.dart';

class ProductDetailsBodyModual extends StatelessWidget {
  const ProductDetailsBodyModual(
      {super.key, required this.cubit, required this.data});
  final HomeCubit cubit;
  final DataEntity data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(16),
        Text(
          data.title ?? '',
          style: AppTextStyle.font24ExtraBoldBlack,
        ),
        const VerticalSpace(16),
        TitleAndPrice(
          title: data.brand?.name ?? '',
          price: 'EGP  ${data.price.toString()}',
          brandImage: data.brand?.image ??
              'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?size=626&ext=jpg',
        ),
        const VerticalSpace(16),
        QuantityAndRating(
          quntity: data.quantity.toString(),
          rating: double.parse((data.ratingsAverage ?? 0).toString()),
        ),
        const VerticalSpace(16),
        Text(
          AppStrings.description,
          style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const VerticalSpace(8),
        ReadMoreText(
          data.description ?? '',
          trimLines: 3,
          colorClickableText: AppColor.blueColor,
          trimMode: TrimMode.Line,
          textAlign: TextAlign.start,
          trimCollapsedText: 'Read more',
          trimExpandedText: '...Show less',
          style: AppTextStyle.font14GreySemiBold,
        ),
      ],
    ).setPadding(context, horizontal: 16);
  }
}
