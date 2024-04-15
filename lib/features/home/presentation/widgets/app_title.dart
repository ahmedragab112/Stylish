import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.svgLogo,
          fit: BoxFit.fill,
        ),
        const HorizantelSpace(9),
        Text(
          AppStrings.styLish,
          style: AppTextStyle.font18SemiBoldPrimeryPink
              .copyWith(color: AppColor.blueColor),
        )
      ],
    );
  }
}
