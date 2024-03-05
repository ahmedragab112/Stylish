import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';
import 'package:stylehub/core/utils/widget/custom_textfiled.dart';
import 'package:stylehub/core/utils/widget/title_text.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';
import 'package:stylehub/features/forgotpassword/presentation/widgets/custom_forgotpassword_richtext.dart';
import 'package:stylehub/features/forgotpassword/presentation/widgets/forgot_password_linster.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ForgotPasswordCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitileText(
          text: AppStrings.forgotPassword,
        ),
        const VerticalSpace(18),
        CustomTextFiled(
          hintText: AppStrings.emailAddress,
          controller: bloc.controller,
          prefixIcon: const Icon(
            Icons.email,
          ),
        ),
        const VerticalSpace(30),
        const ForgotPasswordRichText(
          text: AppStrings.sendEmailRest,
        ),
        const VerticalSpace(30),
        CustomButton(
          text: AppStrings.submit,
          onTap: () async {
            await bloc.sendEmailVerification(email: bloc.controller.text);
          },
        ),
        const ForgotPasswordListern()
      ],
    ).setPadding(context, horizontal: 15, vertical: 15);
  }
}
