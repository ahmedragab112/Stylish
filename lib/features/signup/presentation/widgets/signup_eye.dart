import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/features/signup/presentation/manager/signup_cubit.dart';

class SignUpEye extends StatelessWidget {
  const SignUpEye({super.key, required this.bloc});
 final SignupCubit bloc;
  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
        onTap: () {
          bloc.changeObscureText();
        },
        child: bloc.isObscure
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
