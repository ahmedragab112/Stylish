import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/features/login/presentation/manager/login_cubit_cubit.dart';

class CustomEye extends StatelessWidget {
  const CustomEye({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<LoginCubit>();
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
