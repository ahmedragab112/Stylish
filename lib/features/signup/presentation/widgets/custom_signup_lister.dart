import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/signup/presentation/manager/signup_cubit.dart';

class CustomSignUpLister extends StatelessWidget {
  const CustomSignUpLister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        state.whenOrNull(
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
              context.pushReplacementNamed(AppRoutes.home,
                  arguments: userEntity);
           
            });
          },
          error: (message) {
            Navigator.pop(context);
            context.showSnackBar(message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
