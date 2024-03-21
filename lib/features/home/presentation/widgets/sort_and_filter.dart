import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_filter_button.dart';

class SortAndFilter extends StatelessWidget {
  const SortAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppStrings.allFeature,
          style: AppTextStyle.font18SemiBoldPrimeryPink
              .copyWith(color: Colors.black),
        ),
        const Spacer(),
        const CustomFilterButton(
          text: AppStrings.sort,
          icon: Icons.signal_cellular_alt_outlined,
        ),
        const HorizantelSpace(20),
        const CustomFilterButton(
          text: AppStrings.filter,
          icon: Icons.filter_alt_outlined,
        )
      ],
    );
  }
}
