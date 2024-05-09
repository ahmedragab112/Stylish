import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/add_to_Cart_button.dart';

class AddToCartAndCheckOut extends StatelessWidget {
  const AddToCartAndCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price ',
              style: AppTextStyle.font18SemiBoldPrimeryPink,
            ),
            const VerticalSpace(10),
            Text(
              'EGP ${cubit.spacificIteamModel?.data?.price ?? '0'}',
              style: AppTextStyle.font20SemiBoldWhite
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            )
          ],
        ),
        const HorizantelSpace(22),
        Expanded(
            child: AddToCartButton(
          text: 'Add to cart',
          onTap: () {
            cubit.addToCart(
                productId: cubit.spacificIteamModel!.data!.id ?? '');
          },
        )),
      ],
    ).setPadding(context, horizontal: 16);
  }
}
