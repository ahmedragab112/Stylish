import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/features/home/presentation/model/slider_iteam_model.dart';
import 'package:stylehub/features/home/presentation/widgets/slider_iteam.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: sliderIteamModel
            .map((e) => SliderIteam(
                  color: e.color,
                  crossAxisAlignment: e.cross,
                  image: e.image,
                  descount: e.descount,
                  text: e.text,
                  alignment: e.alignmentGeometry,
                ))
            .toList(),
        options: CarouselOptions(
          height: 200.h,
          viewportFraction: 1,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.ease,
        ));
  }
}
