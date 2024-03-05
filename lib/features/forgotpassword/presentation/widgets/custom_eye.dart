import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';

class CustomEye extends StatelessWidget {
  const CustomEye({super.key, required this.bloc});
  final ForgotPasswordCubit bloc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          bloc.changeObscureText();
        },
        child: bloc.isobscureText
            ? const Icon(
                Icons.visibility_off,
                color: AppColor.greyPrimary,
              )
            : const Icon(
                Icons.remove_red_eye,
                color: AppColor.greyPrimary,
              ));
  }
}
