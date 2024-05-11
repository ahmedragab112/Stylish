import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stylehub/core/cache/user_data_model.dart';
import 'package:stylehub/features/home/presentation/pages/brands.dart';
import 'package:stylehub/features/home/presentation/pages/cart.dart';
import 'package:stylehub/features/home/presentation/pages/setting_body.dart';
import 'package:stylehub/features/home/presentation/pages/wishlist.dart';
import 'package:stylehub/features/home/presentation/widgets/home_body.dart';

class AppConstant {
  static const String baseUrl = 'https://route-ecommerce.onrender.com';
  static const String signUpBaseUrl = 'https://ecommerce.routemisr.com';
  static const String userBox = 'userBox';
}

Duration kanimationDuration = const Duration(milliseconds: 1000);
Box<UserData> userBox = Hive.box<UserData>(AppConstant.userBox);
List<Widget> screens = const [
  HomeBody(),
  WishListBody(),
  CartBody(),
  BrandsBody(),

  SettingBody(),
];
