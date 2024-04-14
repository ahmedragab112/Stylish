import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
              color: AppColor.primeryColor.withOpacity(.5), width: .5)),
      alignment: Alignment.center,
      padding: EdgeInsets.all(6.sp),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: AppTextStyle.font12RegularPrimery
                .copyWith(color: Colors.black, fontSize: 16.sp),
          ),
          const HorizantelSpace(4),
          Icon(
            icon,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
