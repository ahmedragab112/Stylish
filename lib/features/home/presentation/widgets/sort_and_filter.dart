import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/layout/app_layout.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_filter_button.dart';
import 'package:stylehub/features/home/presentation/widgets/sort_iteam.dart';

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
            showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColor.primeryColor,
                    width: .5,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const FilterBody(),
                    ));
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

class FilterBody extends StatelessWidget {
  const FilterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight() * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sort & Filter',
            style: AppTextStyle.font24ExtraBoldBlack,
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(10),
          const Divider(),
          const VerticalSpace(10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sort By',
                      style: AppTextStyle.font20SemiBoldWhite
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SortIteam(
                      selected: true,
                      text: 'Price',
                    ),
                    const SortIteam(
                      selected: false,
                      text: 'Name',
                    ),
                    const SortIteam(
                      selected: false,
                      text: 'New',
                    )
                  ],
                ),
                const VerticalDivider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Keyword',
                      style: AppTextStyle.font20SemiBoldWhite
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SortIteam(
                      selected: true,
                      text: 'New',
                    ),
                    const SortIteam(
                      selected: false,
                      text: 'Old',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ).setPadding(context, vertical: 16, horizontal: 16),
    );
  }
}
