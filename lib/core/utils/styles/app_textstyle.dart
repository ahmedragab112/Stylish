import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';

class AppTextStyle {
  static TextStyle font24ExtraBoldBlack = GoogleFonts.montserrat(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
  static TextStyle font14GreySemiBold = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );
  static TextStyle font18SemiBoldPrimeryPink = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.primeryColor,
  );
}
