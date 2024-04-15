import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/forgotpassword_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/rest_code.dart';
import 'package:stylehub/features/forgotpassword/data/model/update_password_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/user_token_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/verification_code.dart';
import 'package:stylehub/features/forgotpassword/data/service/remote_datasoucre.dart';

class ForgotPasswordRemoteDataSourceImplementation
    implements ForgotPasswordRemoteDataSource {
  final ApiManager apiManager;
  const ForgotPasswordRemoteDataSourceImplementation(
      {required this.apiManager});
  @override
  Future<ApiResponseModel> forgotPassword({required String email}) async {
    return await apiManager.forgotPassword(ForgotPasswordBody(email: email));
  }

  @override
  Future<VerificationCodeModel> verifyRestCode(RestCodeModel code) {
    return apiManager.verifyRestCode(code);
  }

  @override
  Future<UserTokenModel> resetPassword(UpdatePasswordBody updatePasswordBody) {
    return apiManager.resetPassword(updatePasswordBody);
  }
}
