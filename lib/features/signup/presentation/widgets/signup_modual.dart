import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/function/password_validation.dart';
import 'package:stylehub/core/utils/regex/app_regex.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/widget/custom_textfiled.dart';
import 'package:stylehub/features/signup/presentation/manager/signup_cubit.dart';

import 'signup_eye.dart';

class SignUpModual extends StatelessWidget {
  const SignUpModual({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<SignupCubit>();
    return Form(
      key: bloc.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomTextFiled(
            controller: bloc.nameController,
            hintText: AppStrings.name,
            prefixIcon: Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return AppStrings.pleaseEnterValidName;
              }
              return null;
            },
          ),
          const VerticalSpace(31),
          CustomTextFiled(
            validator: (value) {
              if (value!.isEmpty || !AppRegex.isEmailValid(value)) {
                return AppStrings.pleaseEnterValidEmail;
              }
              return null;
            },
            controller: bloc.emailController,
            hintText: AppStrings.email,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const VerticalSpace(31),
          CustomTextFiled(
            validator: (phoneNumber) {
              if (phoneNumber!.isEmpty) {
                return AppStrings.pleaseEnterValidPhone;
              } else if (!AppRegex.hasMatchPhoneNumber(phoneNumber)) {
                return AppStrings.enterOnlyEgyptionNumber;
              }
              return null;
            },
            controller: bloc.phoneController,
            hintText: AppStrings.phone,
            prefixIcon: Icon(
              Icons.phone,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const VerticalSpace(31),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return CustomTextFiled(
                validator: passwordValidation,
                controller: bloc.passwordController,
                hintText: AppStrings.password,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
                obscureText: bloc.isObscure,
                suffixIcon: SignUpEye(
                  bloc: bloc,
                ),
              );
            },
          ),
          const VerticalSpace(31),
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return CustomTextFiled(
                validator: (value) {
                  if (bloc.rePasswordController.text !=
                      bloc.passwordController.text) {
                    return AppStrings.pleaseConfirmTheRightPassword;
                  }
                  return null;
                },
                controller: bloc.rePasswordController,
                hintText: AppStrings.confirmPassword,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
                obscureText: bloc.isObscure,
                suffixIcon: SignUpEye(
                  bloc: bloc,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
