import 'package:flutter/material.dart';

import 'package:stylehub/features/signup/presentation/widgets/sign_upbody.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SignUpBody(),
          )
        ],
      ),
    ));
  }
}
