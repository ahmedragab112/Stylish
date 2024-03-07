import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/api/dio_singelton.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/features/forgotpassword/data/repositories/data_repo.dart';
import 'package:stylehub/features/forgotpassword/data/service/remote_datasource_implementation.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';
import 'package:stylehub/features/forgotpassword/presentation/pages/forgot_password.dart';
import 'package:stylehub/features/forgotpassword/presentation/pages/rest_code.dart';
import 'package:stylehub/features/forgotpassword/presentation/pages/update_user.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasoucre.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasource_implementation.dart';
import 'package:stylehub/features/home/data/repositories/home_repo.dart';
import 'package:stylehub/features/home/domain/usecases/home_usecase.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/pages/home.dart';
import 'package:stylehub/features/home/presentation/pages/homeintro.dart';
import 'package:stylehub/features/login/data/datasources/remote_datasoucre_implementation.dart';
import 'package:stylehub/features/login/data/repositories/data_repo.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';
import 'package:stylehub/features/login/presentation/manager/login_cubit.dart';
import 'package:stylehub/features/login/presentation/pages/login.dart';
import 'package:stylehub/features/onboarding/manager/onboarding_cubit.dart';
import 'package:stylehub/features/onboarding/view/onboarding_view.dart';
import 'package:stylehub/features/signup/presentation/manager/signup_cubit.dart';
import 'package:stylehub/features/signup/presentation/pages/singup.dart';

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
                        loginRemoteDataSouce:
                            LoginRemoteDataSoucreImplementation(
                                apiManager: ApiManager(DioFactory.getDio()))))),
            child: const Login(),
          ),
        );
      case AppRoutes.homeIntro:
        return MaterialPageRoute(
          builder: (context) => const HomeIntro(),
        );

      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnBoardingView(),
          ),
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ForgotPasswordCubit(
                repo: ForgotPasswordDataRepo(
                    dataSource: ForgotPasswordRemoteDataSourceImplementation(
                        apiManager: ApiManager(DioFactory.getDio(),
                            baseUrl: AppConstant.signUpBaseUrl)))),
            child: const ForgotPassword(),
          ),
        );

      case AppRoutes.sendEmailRestCode:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ForgotPasswordCubit(
                    repo: ForgotPasswordDataRepo(
                      dataSource: ForgotPasswordRemoteDataSourceImplementation(
                        apiManager: ApiManager(
                          DioFactory.getDio(),
                        ),
                      ),
                    ),
                  ),
                  child: const RestCode(),
                ));

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(
                homeUseCase: HomeUseCase(
                    homeRepoDomain: HomeDataRepo(
                        homeDataSoucre: HomeDataSoucreImplementation(
                            apiManager: ApiManager(DioFactory.getDio(),
                                baseUrl: AppConstant.baseUrl))))),
            child: const Home(),
          ),
        );
      case AppRoutes.updatePassword:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ForgotPasswordCubit(
                      repo: ForgotPasswordDataRepo(
                          dataSource:
                              ForgotPasswordRemoteDataSourceImplementation(
                                  apiManager: ApiManager(
                    DioFactory.getDio(),
                  )))),
                  child: const UpdateUserPassword(),
                ));
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
