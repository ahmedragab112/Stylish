import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';

class SliderIteamModel {
  final String image;
  final String descount;
  final String text;
  final CrossAxisAlignment cross;
  final Color color;
  final AlignmentGeometry? alignmentGeometry;

  SliderIteamModel( 
      {this.color=AppColor.darkBlueTextColor,this.cross = CrossAxisAlignment.start,
      required this.image,
      required this.descount,
      required this.text,
      this.alignmentGeometry});
}

List<SliderIteamModel> sliderIteamModel = [
  SliderIteamModel(
      image: AppAssets.sliderIteam1,
      descount: "25% OFF",
      text: "For Headphones & AirPods"),
  SliderIteamModel(
    color: Colors.white,
      cross: CrossAxisAlignment.end,
      alignmentGeometry: Alignment.centerRight,
      image: AppAssets.sliderIteam2,
      descount: "30% OFF",
      text: "For Makeup & Skincare"),
  SliderIteamModel(
      image: AppAssets.sliderIteam3,
      descount: "20% OFF",
      text: "For Laptops & Mobiles"),
];
