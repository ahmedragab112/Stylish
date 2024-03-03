import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';

class ForgotPasswordListern extends StatelessWidget {
  const ForgotPasswordListern({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotpasswordState>(
      listenWhen: (previous, current) =>
          current is Success || current is Fail || current is Loading,
      listener: (context, state) => state.whenOrNull(
        success: (data) {
          Navigator.pop(context);
          context.showSnackBar(data.message!);
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
      ),
      child: const SizedBox.shrink(),
    );
  }
}
