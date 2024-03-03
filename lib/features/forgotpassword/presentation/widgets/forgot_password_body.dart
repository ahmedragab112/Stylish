import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';
import 'package:stylehub/core/utils/widget/custom_textfiled.dart';
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
        SizedBox(
          height: 86.h,
          width: 205.w,
          child: Text(
            AppStrings.forgotPassword,
            style: AppTextStyle.font36BoldBlack,
          ),
        ),
        const VerticalSpace(18),
        CustomTextFiled(
          hintText: AppStrings.emailAddress,
          controller: bloc.controller,
          prefixIcon: const Icon(
            Icons.email,
            color: AppColor.primeryColor,
          ),
        ),
        const VerticalSpace(30),
        const ForgotPasswordRichText(),
        const VerticalSpace(30),
        CustomButton(
          text: AppStrings.submit,
          onTap: () async {
            await bloc.forgotPassword();
          },
        ),
       const ForgotPasswordListern()
      ],
    ).setPadding(context, horizontal: 30, vertical: 20);
  }
}
