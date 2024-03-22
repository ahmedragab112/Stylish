import 'package:flutter/material.dart';
import 'package:stylehub/features/home/presentation/pages/cart.dart';
import 'package:stylehub/features/home/presentation/pages/search_body.dart';
import 'package:stylehub/features/home/presentation/pages/setting_body.dart';
import 'package:stylehub/features/home/presentation/pages/wishlist.dart';
import 'package:stylehub/features/home/presentation/widgets/home_body.dart';

class AppConstant {
  static const String baseUrl = 'https://route-ecommerce.onrender.com';
  static const String signUpBaseUrl = 'https://ecommerce.routemisr.com';
}

List<Widget> screens = const [
  HomeBody(),
  WishListBody(),
  CartBody(),
  SearchBody(),
  SettingBody(),
];
