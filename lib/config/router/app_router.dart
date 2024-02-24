import 'package:flutter/material.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/features/home/presentation/pages/home.dart';
import 'package:stylehub/features/login/presentation/pages/login.dart';
import 'package:stylehub/features/signup/presentation/pages/singup.dart';

class AppRouter {
  static Route<Widget> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
