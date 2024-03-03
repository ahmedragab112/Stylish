import 'package:flutter/material.dart';
import 'package:stylehub/features/forgotpassword/presentation/widgets/forgot_password_body.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: ForgotPasswordBody(),
          )
        ]),
      ),
    );
  }
}
