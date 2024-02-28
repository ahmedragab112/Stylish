import 'package:flutter/material.dart';
import 'package:stylehub/features/login/presentation/widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: LoginBody()),
        ],
      )),
    );
  }
}
