import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/api/dio_singelton.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/features/home/presentation/pages/home.dart';
import 'package:stylehub/features/login/data/datasources/remote_datasoucre_implementation.dart';
import 'package:stylehub/features/login/data/repositories/data_repo.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';
import 'package:stylehub/features/login/presentation/pages/login.dart';
import 'package:stylehub/features/onboarding/manager/onboarding_cubit.dart';
import 'package:stylehub/features/onboarding/view/onboarding_view.dart';
import 'package:stylehub/features/signup/presentation/pages/singup.dart';
import '../../features/login/presentation/manager/login_cubit.dart';
import '../../features/signup/presentation/cubit/signup_cubit.dart';

class AppRouter {
  static Route<Widget> onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => locator<SignupCubit>(),
            child: const SignUp(),
          ),
        );
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(
              loginUseCase: LoginUseCase(
                loginRepo: LoginDataRepo(
                  loginRemoteDataSouce: LoginRemoteDataSoucreImplementation(
                    apiManager: ApiManager(
                      DioFactory.getDio(),
                    ),
                  ),
                ),
              ),
            ),
            child: const Login(),
          ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) =>  BlocProvider(
            create: (context) => OnboardingCubit(),
            child:const OnBoardingView(),
          ),
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
