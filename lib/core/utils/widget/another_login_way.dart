import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/login/presentation/widgets/custom_login_circle.dart';

class AnOtherLoginWays extends StatelessWidget {
  const AnOtherLoginWays({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BounceInLeft(
          duration: const Duration(milliseconds: 1000),
          child: const CustomLoginCircle(
            image: AppAssets.google,
          ),
        ),
        const HorizantelSpace(20),
        BounceInRight(
          duration: const Duration(milliseconds: 1000),
          child: const CustomLoginCircle(
            image: AppAssets.facebook,
          ),
        ),
      ],
    );
  }
}
