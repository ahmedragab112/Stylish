import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';

String getInitRoute() {
  if (locator<CacheHelper>().getBool(AppStrings.cacheKeyIsVisited) == true) {
    if (locator<CacheHelper>()
        .getString(AppStrings.cacheKeyUserToken)
        .isNotEmpty) {
      return AppRoutes.homeIntro;
    }
    return AppRoutes.signIn;
  } else {
    return AppRoutes.onBoarding;
  }
}
