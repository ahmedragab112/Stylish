import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/features/login/presentation/widgets/custom_login_circle.dart';

class AnOtherLoginWays extends StatelessWidget {
  const AnOtherLoginWays({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomLoginCircle(
          image: AppAssets.google,
        ),
        HorizantelSpace(20),
        CustomLoginCircle(
          image: AppAssets.facebook,
        ),
      ],
    );
  }
}
