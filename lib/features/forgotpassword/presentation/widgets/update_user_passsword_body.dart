import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/function/password_validation.dart';
import 'package:stylehub/core/utils/regex/app_regex.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';
import 'package:stylehub/core/utils/widget/custom_rich_text.dart';
import 'package:stylehub/core/utils/widget/custom_textfiled.dart';
import 'package:stylehub/core/utils/widget/title_text.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';
import 'package:stylehub/features/forgotpassword/presentation/widgets/custom_eye.dart';
import 'package:stylehub/features/forgotpassword/presentation/widgets/forgot_password_linster.dart';

class UpdateUserPasswordBody extends StatelessWidget {
  const UpdateUserPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ForgotPasswordCubit>(context);
    return Form(
      key: bloc.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitileText(
            text: AppStrings.changePassword,
          ),
          const VerticalSpace(35),
          CustomTextFiled(
            controller: bloc.emailController,
            hintText: AppStrings.userNameOrEmail,
            prefixIcon: const Icon(
              Icons.person,
            ),
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return AppStrings.pleaseEnterValidEmail;
              }
              return null;
            },
          ),
          const VerticalSpace(31),
          BlocBuilder<ForgotPasswordCubit, ForgotpasswordState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<ForgotPasswordCubit>(context);
              return CustomTextFiled(
                validator: (value) {
                  passwordValidation(value);
                  return null;
                },
                controller: bloc.passwordController,
                hintText: AppStrings.password,
                prefixIcon: const Icon(
                  Icons.lock,
                ),
                obscureText: cubit.isobscureText,
                suffixIcon: CustomEye(
                  bloc: cubit,
                ),
              );
            },
          ),
          const VerticalSpace(30),
          CustomButton(
            text: AppStrings.restPassword,
            onTap: () async {
              if (bloc.formKey.currentState!.validate()) {
                await bloc.resetPassword();
              }
            },
          ),
          const VerticalSpace(30),
          CustomRichText(
            textAlign: TextAlign.start,
            text: AppStrings.creatAccount,
            headLineText: AppStrings.signup,
            onTap: () {
              context.pushNamedAndRemoveUntil(AppRoutes.signUp);
            },
          ),
          const ForgotPasswordListern()
        ],
      ).setPadding(context, vertical: 15, horizontal: 15),
    );
  }
}
