import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';

abstract class LoginRepo {
  Future<ApiResponse<UserEntity>> login({required LoginData loginData});
}
