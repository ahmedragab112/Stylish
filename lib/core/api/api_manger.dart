import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stylehub/core/api/end_point.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/features/forgotpassword/data/model/forgotpassword_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/rest_code.dart';
import 'package:stylehub/features/forgotpassword/data/model/update_password_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/user_token_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/verification_code.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/model/user_model.dart';

part 'api_manger.g.dart';

@RestApi(baseUrl: AppConstant.baseUrl)
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @POST(EndPoint.signUpEndPoint)
  Future<UserModel> signUpUser(@Body() UserData userData);
  @POST(EndPoint.loginEndPoint)
  Future<UserModel> loginUser(@Body() LoginData loginData);
  @POST(EndPoint.forgotPasswordEndPoint)
  Future<ApiResponseModel> forgotPassword(@Body() ForgotPasswordBody email);
  @POST(EndPoint.verifyRestCodeEndPoint)
  Future<VerificationCodeModel> verifyRestCode(@Body() RestCodeModel code);
  
  @PUT(EndPoint.resetPasswordEndPoint)
  Future<UserTokenModel> resetPassword(
      @Body() UpdatePasswordBody updatePasswordBody);
}
