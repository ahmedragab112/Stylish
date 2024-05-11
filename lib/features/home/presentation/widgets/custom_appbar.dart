import 'package:flutter/material.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';
import 'package:stylehub/features/home/presentation/manager/home_cubit.dart';
import 'package:stylehub/features/home/presentation/widgets/app_title.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_widget_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomWidgetButton(
          child: Icon(
            Icons.menu,
            color: Color(0xff323232),
            size: 24,
          ),
        ),
        const AppTitle(),
        GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.profile, arguments: cubit);
          },
          child: CustomWidgetButton(
            child: Image.asset(
              AppAssets.person,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ],
    );
  }
}
