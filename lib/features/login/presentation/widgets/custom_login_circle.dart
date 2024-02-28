import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';

class CustomLoginCircle extends StatelessWidget {
  const CustomLoginCircle({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32.r,
      backgroundColor: AppColor.primeryColor,
      child: CircleAvatar(
        backgroundColor: AppColor.darkWhite,
        radius: 30.r,
        child: Center(
            child: Image.asset(
          image,
          fit: BoxFit.fill,
          width: 24.w,
          height: 24.h,
        )),
      ),
    );
  }
}
