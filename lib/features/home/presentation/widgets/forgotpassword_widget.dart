import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/regex/app_regex.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_textfiled.dart';

class UpdatePasword extends StatelessWidget {
  const UpdatePasword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeCubit>();
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Update Password',
            style: AppTextStyle.font24ExtraBoldBlack,
          ),
          const VerticalSpace(8),
          Text(
            "Enter your previce password and new",
            style: AppTextStyle.font12RegularPrimery,
            textAlign: TextAlign.center,
          ),
          const VerticalSpace(16),
          Form(
            key: bloc.forgotPasswordValidationKey,
            child: Column(
              children: [
                CustomTextFiled(
                  lableText: 'Previce Password',
                  controller: bloc.changePasswordController,
                  validator: (value) {
                    return null;
                  },
                ),
                const VerticalSpace(16),
                CustomTextFiled(
                  lableText: 'New Password',
                  controller: bloc.changePasswordNewPasswordController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        AppRegex.isPasswordValid(value) == false) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                ),
                const VerticalSpace(16),
                CustomTextFiled(
                  lableText: 'Confirm Password',
                  controller: bloc.changePasswordNewPasswordConfirmController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        bloc.changePasswordNewPasswordController.text !=
                            bloc.changePasswordNewPasswordConfirmController
                                .text) {
                      return 'The password does not match';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const VerticalSpace(16),
          CustomButton(
            text: 'Reset Password',
            onTap: () async {
              if (bloc.forgotPasswordValidationKey.currentState!.validate()) {
                await bloc.updateLoggedUserPassword();
              }
            },
          ),
          
        ],
      ).setOnlyPadding(
        context,
        left: 8.w,
        right: 18.w,
        top: 8.h,
        bottom: 8.h,
      ),
    );
  }
}
