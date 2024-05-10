import 'package:flutter/material.dart';
import 'package:stylehub/features/home/presentation/pages/brands.dart';
import 'package:stylehub/features/home/presentation/pages/cart.dart';
import 'package:stylehub/features/home/presentation/pages/profile_body.dart';
import 'package:stylehub/features/home/presentation/pages/setting_body.dart';
import 'package:stylehub/features/home/presentation/pages/wishlist.dart';
import 'package:stylehub/features/home/presentation/widgets/home_body.dart';

class AppConstant {
  static const String baseUrl = 'https://route-ecommerce.onrender.com';
  static const String signUpBaseUrl = 'https://ecommerce.routemisr.com';
  static const String userBox = 'userBox';
}

List<Widget> screens = const [
  HomeBody(),
  WishListBody(),
  CartBody(),
  BrandsBody(),
  ProfileBody(),
  SettingBody(),
];
