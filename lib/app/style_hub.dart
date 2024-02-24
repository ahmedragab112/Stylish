import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylehub/config/theme/dark_theme.dart';
import 'package:stylehub/config/theme/light_theme.dart';

class StyleHub extends StatelessWidget {
  const StyleHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:  LightTheme.lightTheme,
        darkTheme:  DarkTheme.darkTheme,
        themeMode: ThemeMode.system,
        
      ),
    );
  }
}
