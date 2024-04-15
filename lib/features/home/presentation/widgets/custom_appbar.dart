import 'package:flutter/material.dart';
import 'package:stylehub/core/utils/images/app_assets.dart';
import 'package:stylehub/features/home/presentation/widgets/app_title.dart';
import 'package:stylehub/features/home/presentation/widgets/custom_widget_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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
        CustomWidgetButton(
          child: Image.asset(
            AppAssets.person,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
