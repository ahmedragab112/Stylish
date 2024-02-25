import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';

abstract class SignUpRepo {
  Future<ApiResponse<UserEntity>> signUp({required UserData userData});
}
