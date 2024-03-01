import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/login/presentation/manager/login_cubit.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoginLister extends StatelessWidget {
  const CustomLoginLister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Fail,
      listener: (context, state) => state.whenOrNull(
        loading: () {
          return showDialog(
            context: context,
            builder: (context) => const Center(
                child: LoadingIndicator(
              indicatorType: Indicator.circleStrokeSpin,
            )),
          );
        },
        success: (userEntity) async {
          Navigator.pop(context);
          return await locator<CacheHelper>()
              .setBool(AppStrings.cacheKeyIsLogin, true)
              .then((value) {
            context.pushReplacementNamed(AppRoutes.home, arguments: userEntity);
            return null;
          });
        },
        fail: (message) {
          return Navigator.pop(context);
        },
      ),
      child: const SizedBox.shrink(),
    );
  }
}
