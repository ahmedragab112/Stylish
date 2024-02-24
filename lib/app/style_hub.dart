import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/router/app_router.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/config/theme/dark_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stylehub/config/theme/light_theme.dart';

class StyleHub extends StatelessWidget {
  const StyleHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        debugShowCheckedModeBanner: false,
        theme: LightTheme.lightTheme,
        darkTheme: DarkTheme.darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter.onGenrateRoute,
        initialRoute: AppRoutes.signUp,
        locale: const Locale('en'),
      ),
    );
  }
}
