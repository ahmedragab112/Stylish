import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/api/dio_singelton.dart';
import 'package:stylehub/features/home/presentation/pages/home.dart';
import 'package:stylehub/features/login/presentation/pages/login.dart';
import 'package:stylehub/features/signup/data/datasources/remote/remote_datasource_implementation.dart';
import 'package:stylehub/features/signup/data/repositories/remote_repo_implmentation.dart';
import 'package:stylehub/features/signup/domain/usecases/signup_usecase.dart';
import 'package:stylehub/features/signup/presentation/cubit/signup_cubit.dart';
import 'package:stylehub/features/signup/presentation/pages/singup.dart';

class AppRouter {
  static Route<Widget> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SignupCubit(
                signUpUsecase: SignUpUsecase(
                    signUpRepo: SignUpDataRepo(
                        remoteDataSource: RemoteDataSoucresImplementation(
                            apiManager: ApiManager(DioFactory.getDio()))))),
            child: const SignUp(),
          ),
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
