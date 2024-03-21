import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class CategoryIteam extends StatelessWidget {
  const CategoryIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CachedNetworkImage(
            height: 56.h,
            fit: BoxFit.fill,
            width: 56.w,
            imageUrl:
                "https://api.softwarekeep.com/media/nimbus/helpcenter/errr.png",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const VerticalSpace(4),
        Text(
          "Categores",
          style: AppTextStyle.font12RegularPrimery,
        ),
      ],
    );
  }
}
