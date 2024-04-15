import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';

class SortIteam extends StatelessWidget {
  const SortIteam(
      {super.key, required this.selected, required this.text, this.onTap});
  final bool selected;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: selected ? AppColor.primeryColor : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.black, width: .5),
        ),
        child: Text(
          text,
          style: AppTextStyle.font14GreySemiBold
              .copyWith(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
