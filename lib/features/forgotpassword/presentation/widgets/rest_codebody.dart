import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/app_router.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
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
        ElasticInLeft(
          duration: kanimationDuration,
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        const VerticalSpace(30),
        FadeInDown(
            duration: kanimationDuration,
          child: const TitileText(text: AppStrings.restCode)),
        const VerticalSpace(30),
        FadeInLeft(
          duration: kanimationDuration,
          child: CustomTextFiled(
              hintText: AppStrings.restCode,
              controller: cubit.restPasswordController,
              prefixIcon: const Icon(Icons.lock, color: AppColor.primeryColor)),
        ),
        const VerticalSpace(30),
        FadeInRight(
          duration: kanimationDuration,
          child: const ForgotPasswordRichText(
            text: AppStrings.enterRestCodeWhichSentToYourEmail,
          ),
        ),
        const VerticalSpace(30),
        ElasticInUp(
          duration: kanimationDuration,
          child: CustomButton(
              text: AppStrings.submit,
              onTap: () async {
                await cubit.verifyRestCode(
                    code: cubit.restPasswordController.text);
              }),
        ),
        const ForgotPasswordListern()
      ],
    ).setPadding(context, horizontal: 15, vertical: 15);
  }
}
