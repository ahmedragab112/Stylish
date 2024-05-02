import 'package:flutter/material.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/presentation/widgets/add_to_Cart_button.dart';

class AddToCartAndCheckOut extends StatelessWidget {
  const AddToCartAndCheckOut({super.key, required this.data});

  final DataEntity data;

  @override
  Widget build(BuildContext context) {
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
              'EGP ${data.price}',
              style: AppTextStyle.font24ExtraBoldBlack
                  .copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
        const HorizantelSpace(30),
        Expanded(
            child: AddToCartButton(
          text: 'Add to cart',
          onTap: () {},
        )),
      ],
    ).setPadding(context, horizontal: 16);
  }
}
