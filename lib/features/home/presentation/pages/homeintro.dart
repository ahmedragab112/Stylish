import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';
import 'package:stylehub/features/home/presentation/widgets/home_introbody.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppAssets.getStarted,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          const HomeIntroBody()
        ],
      ),
    );
  }
}
