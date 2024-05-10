import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';
import 'package:stylehub/core/utils/widget/custom_rich_text.dart';
import 'package:stylehub/core/utils/widget/another_login_way.dart';
import 'package:stylehub/core/utils/widget/title_text.dart';
import 'package:stylehub/features/signup/presentation/manager/signup_cubit.dart';
import 'package:stylehub/features/signup/presentation/widgets/custom_signup_lister.dart';
import 'package:stylehub/features/signup/presentation/widgets/gree_to_ourrules.dart';
import 'package:stylehub/features/signup/presentation/widgets/signup_modual.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<SignupCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BounceInDown(
          from: 100,
          child: const TitileText(
            text: AppStrings.creatAccount,
          ),
        ),
        const VerticalSpace(35),
        const SignUpModual(),
        const VerticalSpace(10),
        const AgreeToRules(),
        const VerticalSpace(20),
        CustomButton(
          text: AppStrings.createAccount,
          onTap: () async {
            if (bloc.formKey.currentState!.validate()) {
              await bloc.signUp();
            }
          },
        ),
        const VerticalSpace(20),
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
        const AnOtherLoginWays(),
        const VerticalSpace(28),
        CustomRichText(
          text: AppStrings.alreadyHaveAccount,
          headLineText: AppStrings.login,
          onTap: () {
            context.pushReplacementNamed(AppRoutes.signIn);
          },
        ),
        const CustomSignUpLister()
      ],
    ).setPadding(context, vertical: 20, horizontal: 20);
  }
}
