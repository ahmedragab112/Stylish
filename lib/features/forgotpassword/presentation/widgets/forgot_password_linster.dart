import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/function/motion_toast.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';

class ForgotPasswordListern extends StatelessWidget {
  const ForgotPasswordListern({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotpasswordState>(
      listenWhen: (previous, current) =>
          current is Success ||
          current is Fail ||
          current is Loading ||
          current is SuccessRestCode ||
          current is FailRestCode ||
          current is LoadingRestCode ||
          current is UpdateUserFail ||
          current is UpdateUserLoading ||
          current is UpdateUserSuccess,
      listener: (context, state) => state.whenOrNull(
        success: (data) {
          Navigator.pop(context);
          context.showSnackBar(data.message!);
          context.pushNamed(AppRoutes.sendEmailRestCode);
          return null;
        },
        fail: (apiResponseModel) {
          Navigator.pop(context);
          context.showSnackBar(apiResponseModel.message!);
          return null;
        },
        loading: () => showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(color: AppColor.primeryColor),
          ),
        ),
        successRestCode: (data) {
          Navigator.pop(context);
          context.showSnackBar(data.status);
          context.pushNamed(AppRoutes.updatePassword);
          return null;
        },
        failRestCode: (apiResponseModel) {
          Navigator.pop(context);
          context.showSnackBar(apiResponseModel.message!);
          return null;
        },
        loadingRestCode: () => showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(color: AppColor.primeryColor),
          ),
        ),
        updateUserFail: (apiResponseModel) {
          Navigator.pop(context);
          context.showSnackBar(apiResponseModel.message!);
          return null;
        },
        updateUserLoading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColor.primeryColor),
            ),
          );
          return null;
        },
        updateUserSuccess: (userTokenModel) async {
          Navigator.pop(context);
          successToast(context, title: 'password has been updated');
          context.pushNamedAndRemoveUntil(AppRoutes.signIn);
          return null;
        },
      ),
      child: const SizedBox.shrink(),
    );
  }
}
