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

class RestCodeBody extends StatelessWidget {
  const RestCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ForgotPasswordCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        const VerticalSpace(30),
        const TitileText(text: AppStrings.restCode),
        const VerticalSpace(30),
        CustomTextFiled(
          controller: cubit.restPasswordController,
          hintText: AppStrings.restCode,
          type: TextInputType.number,
          prefixIcon: const Icon(Icons.lock),
        ),
        const VerticalSpace(30),
        const ForgotPasswordRichText(
          text: AppStrings.enterRestCodeWhichSentToYourEmail,
        ),
        const VerticalSpace(30),
        CustomButton(
          text: AppStrings.submit,
          onTap: () async {
            await cubit.verifyRestCode();
          },
        ),
        const ForgotPasswordListern()
      ],
    ).setPadding(context, horizontal: 30, vertical: 20);
  }
}
