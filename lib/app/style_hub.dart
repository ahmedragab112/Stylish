import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/app_router.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/config/theme/dark_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stylehub/config/theme/light_theme.dart';
import 'package:stylehub/core/function/get_initroute.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';

class StyLish extends StatelessWidget {
  const StyLish({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: AppStrings.styLish,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: LightTheme.lightTheme,
        darkTheme: DarkTheme.darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.onGenrateRoute,
        initialRoute: AppRoutes.forgotPassword,
        locale: const Locale('en'),
      ),
    );
  }
}
