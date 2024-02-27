import 'package:flutter/material.dart';
import 'package:stylehub/features/onboarding/widgets/onbarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoardingBody()),
    );
  }
}
