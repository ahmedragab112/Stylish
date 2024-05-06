import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.onTap, required this.icon, this.size = 20});
  final Function()? onTap;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColor.blueColor,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColor.primeryColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
