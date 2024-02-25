import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:stylehub/core/api/end_point.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/features/signup/data/models/user_model.dart';

part 'api_manger.g.dart';

@RestApi(baseUrl: AppConstant.signUpBaseUrl)
abstract class ApiManager {
  factory ApiManager(Dio dio, {String baseUrl}) = _ApiManager;

  @POST(EndPoint.signUpEndPoint)
  Future<UserModel> signUpUser(@Body() UserData userData);
}
