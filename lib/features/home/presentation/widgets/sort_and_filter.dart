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
          AppStrings.allCategory,
          style: AppTextStyle.font18SemiBoldPrimeryPink
              .copyWith(color: Colors.black),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  AppStrings.sort,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font24ExtraBoldBlack
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                content: Row(
                  children: [
                    IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Sort by',
                            style: AppTextStyle.font18SemiBoldPrimeryPink
                                .copyWith(color: Colors.black),
                          ),
                          const Text('_______'),
                          const VerticalSpace(10),
                          Text(
                            'Name',
                            style: AppTextStyle.font12RegularPrimery
                                .copyWith(color: Colors.black),
                          ),
                          const VerticalSpace(10),
                          Text(
                            'Price',
                            style: AppTextStyle.font12RegularPrimery
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const CustomFilterButton(
            text: AppStrings.sort,
            icon: Icons.signal_cellular_alt_outlined,
          ),
        ),
      ],
    );
  }
}
