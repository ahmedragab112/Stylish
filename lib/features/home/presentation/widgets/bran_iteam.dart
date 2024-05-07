import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';

class BrandIteam extends StatelessWidget {
  const BrandIteam({super.key, required this.data});
  final Data data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(data.sId??'data is null');
        context.pushNamed(AppRoutes.brandProduct, arguments: data.sId!);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: NetworkImage(data.image ?? ""),
                fit: BoxFit.fill,
              ),
            ),
          ).setPadding(context, horizontal: 10, vertical: 10),
          Positioned(
            bottom: 20.h,
            child: Text(
              data.name ?? "",
              style: AppTextStyle.font14GreySemiBold.copyWith(
                color: AppColor.primeryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
