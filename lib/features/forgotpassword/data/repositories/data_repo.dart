import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/error/error_handler.dart';
import 'package:stylehub/features/forgotpassword/data/model/rest_code.dart';
import 'package:stylehub/features/forgotpassword/data/model/update_password_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/user_token_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/verification_code.dart';
import 'package:stylehub/features/forgotpassword/data/service/remote_datasoucre.dart';

import '../../../../core/error/error_model.dart';

class ForgotPasswordDataRepo {
  final ForgotPasswordRemoteDataSource dataSource;
  const ForgotPasswordDataRepo({required this.dataSource});
  Future<ApiResponse<ApiResponseModel>> forgotPassword(
      {required String email}) async {
    try {
      var data = await dataSource.forgotPassword(email: email);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  Future<ApiResponse<VerificationCodeModel>> verifyRestCode(
      RestCodeModel code) async {
    try {
      var data = await dataSource.verifyRestCode(code);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  Future<ApiResponse<UserTokenModel>> resetPassword(
      UpdatePasswordBody updatePasswordBody) async {
    try {
      var data = await dataSource.resetPassword(updatePasswordBody);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
