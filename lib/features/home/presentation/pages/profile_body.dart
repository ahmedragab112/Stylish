import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/colors/app_color.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/core/utils/styles/app_textstyle.dart';
import 'package:stylehub/core/utils/widget/custom_button.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_data_containter.dart';
import 'package:stylehub/features/home/presentation/widgets/forgotpassword_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    alignment: Alignment.centerLeft,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  const VerticalSpace(24),
                  Center(
                    child: Image.asset(
                      'assets/images/edit_profile.png',
                      width: 66.w,
                      height: 66.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const VerticalSpace(24),
                  Text(
                    'Welcome , ${cubit.userData?.name!.split(' ').first}',
                    style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                        fontWeight: FontWeight.w500, color: AppColor.greyColor),
                    textAlign: TextAlign.start,
                  ),
                  const VerticalSpace(12),
                  Text(
                    'Personal Details',
                    style: AppTextStyle.font18SemiBoldPrimeryPink.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                  const VerticalSpace(20),
                  Text(
                    'Email address',
                    style: AppTextStyle.font14GreySemiBold
                        .copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  const VerticalSpace(15),
                  CustomDataContainer(
                    txt: cubit.userData?.email ?? '',
                  ),
                  const VerticalSpace(28),
                  Text(
                    'Password',
                    style: AppTextStyle.font14GreySemiBold
                        .copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  const VerticalSpace(28),
                  const CustomDataContainer(
                    txt: '***********************',
                  ),
                  const VerticalSpace(28),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18)),
                          ),
                          builder: (context) => BlocProvider(
                                create: (context) => homeCubit,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: const UpdatePasword(),
                                ),
                              ));
                    },
                    child: Text(
                      'Change Password',
                      style: AppTextStyle.font12RegularPrimery.copyWith(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primeryColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const VerticalSpace(36),
                  const Divider(
                    color: AppColor.greyColor,
                    thickness: .5,
                  ),
                  const VerticalSpace(36),
                  CustomButton(
                    text: 'Log Out',
                    onTap: () async {
                      await locator<CacheHelper>()
                          .setBool(AppStrings.cacheKeyIsLogin, false);
                      await locator<CacheHelper>()
                          .remove(AppStrings.cacheKeyUserToken)
                          .then((value) async {
                        await userBox.clear().then((value) {
                          context.pushNamedAndRemoveUntil(AppRoutes.signIn);
                        });
                      });
                    },
                  ),
                  const VerticalSpace(36),
                  SizedBox(
                    width: 258.w,
                    height: 30.h,
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(children: [
                        TextSpan(
                          text: AppStrings.byClickingThe,
                          style: AppTextStyle.font12RegularPrimery
                              .copyWith(color: AppColor.greyPrimary),
                        ),
                        TextSpan(
                            text: AppStrings.logOut,
                            style: AppTextStyle.font12RegularPrimery),
                        TextSpan(
                            text: AppStrings.youWillBackToLogin,
                            style: AppTextStyle.font12RegularPrimery
                                .copyWith(color: AppColor.greyPrimary))
                      ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ).setPadding(context, horizontal: 16, vertical: 6),
      ),
    );
  }
}
