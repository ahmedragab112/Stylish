import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/rest_code.dart';
import 'package:stylehub/features/forgotpassword/data/model/update_password_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/user_token_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/verification_code.dart';

abstract class RemoteDataSource {
  Future<ApiResponseModel> forgotPassword({required String email});

  Future<VerificationCodeModel> verifyRestCode(RestCodeModel code);

  Future<UserTokenModel> resetPassword(UpdatePasswordBody updatePasswordBody);
}
