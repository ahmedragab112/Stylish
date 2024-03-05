import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext  {
   double screenWidth() {
    return MediaQuery.of(this).size.width;
  }

   double screenHeight() {
    return MediaQuery.of(this).size.height;
  }

   double getHeight(double pixle) {
    double screenHight = screenHeight();
    double x = screenHight / pixle;
    return  x;
  }

   double getWidth(double pixle) {
    double width =screenWidth();
    double x = width / pixle;
    return  x;
  }
  
}