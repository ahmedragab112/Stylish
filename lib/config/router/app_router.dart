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
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/pages/brand_product.dart';
import 'package:stylehub/features/home/presentation/pages/product_details.dart';
import 'package:stylehub/features/home/presentation/pages/category_iteams.dart';
import 'package:stylehub/features/home/presentation/pages/home.dart';
import 'package:stylehub/features/home/presentation/pages/homeintro.dart';
import 'package:stylehub/features/home/presentation/pages/profile_body.dart';
import 'package:stylehub/features/login/presentation/manager/login_cubit.dart';
import 'package:stylehub/features/login/presentation/pages/login.dart';
import 'package:stylehub/features/onboarding/manager/onboarding_cubit.dart';
import 'package:stylehub/features/onboarding/view/onboarding_view.dart';
import 'package:stylehub/features/signup/presentation/manager/signup_cubit.dart';
import 'package:stylehub/features/signup/presentation/pages/singup.dart';

const Duration kanimationDuration = Duration(seconds: 1);

class AppRouter {
  static Route<Widget> onGenrateRoute(RouteSettings settings) {
    String? args;
    HomeCubit? cubit;
    if (settings.arguments is String) {
      args = settings.arguments as String;
    }

    if (settings.arguments is HomeCubit) {
      cubit = settings.arguments as HomeCubit;
    }
    switch (settings.name) {
      case AppRoutes.signUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) => locator<SignupCubit>(),
            child: const SignUp(),
          ),
        );
      case AppRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => locator<LoginCubit>(),
            child: const Login(),
          ),
        );
      case AppRoutes.homeIntro:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<HomeCubit>.value(
            value: homeCubit,
            child: const HomeIntro(),
          ),
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
                  apiManager: ApiManager(
                    DioFactory.getDio(),
                    baseUrl: AppConstant.signUpBaseUrl,
                  ),
                ),
              ),
            ),
            child: const ForgotPassword(),
          ),
        );

      case AppRoutes.sendEmailRestCode:
        return PageRouteBuilder(
            transitionDuration: kanimationDuration,
            settings: settings,
            transitionsBuilder: (_, animation, __, child) => SlideTransition(
                  position: animation.drive(Tween<Offset>(
                      begin: const Offset(1, 0), end: Offset.zero)),
                  child: child,
                ),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider.value(
                  value: forgotPasswordCubit,
                  child: const RestCode(),
                ));

      case AppRoutes.categoryIteamPage:
        return PageRouteBuilder(
            transitionDuration: kanimationDuration,
            settings: settings,
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider.value(
                  value: homeCubit,
                  child: const CategoryIteams(),
                ));

      case AppRoutes.home:
        return PageRouteBuilder(
          transitionDuration: kanimationDuration,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => locator<HomeCubit>()
              ..getAllCategory()
              ..getAllProducts()
              ..getLoggedUserWishList()
              ..getAllBrand()
              ..getLoggedUserCartData()
              ..getUserData(),
            child: const Home(),
          ),
        );
      case AppRoutes.updatePassword:
        return PageRouteBuilder(
          transitionDuration: kanimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            alignment: Alignment.centerLeft,
            scale: animation,
            child: child,
          ),
          pageBuilder: (context, animation, secondaryAnimation) =>
              BlocProvider.value(
            value: forgotPasswordCubit,
            child: const UpdateUserPassword(),
          ),
        );
      case AppRoutes.productDetails:
        return PageRouteBuilder(
          transitionDuration: kanimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            alignment: Alignment.topLeft,
            scale: animation,
            child: child,
          ),
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BlocProvider.value(
            value: homeCubit..getSpacifcIteam(productId: args!),
            child: ProductDetails(id: args),
          ),
        );
      case AppRoutes.brandProduct:
        return PageRouteBuilder(
          transitionDuration: kanimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            alignment: Alignment.bottomCenter,
            scale: animation,
            child: child,
          ),
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              BlocProvider.value(
            value: homeCubit
              ..getSpacificBrand(brandId: args!)
              ..getProductInBrand(brandId: args),
            child: const BrandProducts(),
          ),
        );

      case AppRoutes.profile:
        return PageRouteBuilder(
          transitionDuration: kanimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            alignment: Alignment.centerLeft,
            scale: animation,
            child: child,
          ),
          pageBuilder: (context, animation, secondaryAnimation) =>
               Profile(cubit: cubit!,),
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
