import 'package:stylehub/core/utils/regex/app_regex.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';

String? passwordValidation(String? value) {
  if (value?.isEmpty ?? false) {
    return 'Please enter password';
  } else if (!AppRegex.hasLowerCase(value??'')) {
    return AppStrings.enterLowerAtLeastOneLowerCase;
  } else if (!AppRegex.hasNumber(value??'')) {
    return AppStrings.enterAtLeastOneNumber;
  } else if (!AppRegex.hasMinLength(value??'')) {
    return AppStrings.enterAtLeast8Characters;
  } else if (!AppRegex.hasUpperCase(value??'')) {
    return AppStrings.enterUpperAtLeastOneUpperCase;
  } else if (!AppRegex.hasSpecialCharacter(value??'')) {
    return AppStrings.enterAtLeastOneSpecialCharacter;
  }
  return null;
}
