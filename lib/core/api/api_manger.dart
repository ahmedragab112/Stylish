import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stylehub/core/api/end_point.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
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
}