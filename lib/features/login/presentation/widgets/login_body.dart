import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';
import 'package:stylehub/core/utils/widget/custom_rich_text.dart';
import 'package:stylehub/core/utils/widget/custom_textfiled.dart';
import 'package:stylehub/features/login/presentation/manager/login_cubit_cubit.dart';
import 'package:stylehub/features/login/presentation/widgets/another_login_way.dart';
import 'package:stylehub/features/login/presentation/widgets/custom_eye.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 182.w,
          height: 83.h,
          child: Text(
            AppStrings.welcomeBack,
            style: AppTextStyle.font36BoldBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
        ),
        const VerticalSpace(35),
        CustomTextFiled(
          controller: bloc.emailController,
          hintText: AppStrings.userNameOrEmail,
          prefixIcon: Icon(
            Icons.person,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const VerticalSpace(31),
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return CustomTextFiled(
              controller: bloc.passwordController,
              hintText: AppStrings.password,
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
              ),
              obscureText: bloc.isobscureText,
              suffixIcon: const CustomEye(),
            );
          },
        ),
        const VerticalSpace(10),
        Text(
          AppStrings.forgotPassword,
          textAlign: TextAlign.end,
          style: AppTextStyle.font12RegularPrimery,
        ),
        const VerticalSpace(52),
        CustomButton(
          text: AppStrings.login,
          onTap: () async {
            bloc.login();
          },
        ),
        const VerticalSpace(75),
        Text(
          AppStrings.orContinueWith,
          style: AppTextStyle.font12RegularPrimery
              .copyWith(color: AppColor.greyColor),
          textAlign: TextAlign.center,
        ),
        const VerticalSpace(20),
        const Divider(
          color: AppColor.greyColor,
          thickness: .2,
        ),
        const VerticalSpace(20),
        const LoginWays(),
        const VerticalSpace(28),
        CustomRichText(
          text: AppStrings.creatAccount,
          headLineText: AppStrings.signup,
          onTap: () {
            context.pushReplacementNamed(AppRoutes.signUp);
          },
        )
      ],
    ).setPadding(context, vertical: 20, horizontal: 20);
  }
}
