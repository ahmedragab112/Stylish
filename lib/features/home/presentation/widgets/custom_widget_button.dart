import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';

class CustomWidgetButton extends StatelessWidget {
  const CustomWidgetButton({super.key, this.child});
 final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: 40.w,
        height: 40.h,
        decoration: const BoxDecoration(
            color: AppColor.whiteColor, shape: BoxShape.circle),
        child: child,
      ),
    );
  }
}
