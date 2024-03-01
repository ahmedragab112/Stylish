import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/domain/repositories/login_domainrepo.dart';

class LoginUseCase {
 final LoginRepo loginRepo;
 const LoginUseCase({required this.loginRepo});
  Future<ApiResponse<UserEntity>> login(
      {required LoginData loginData})  =>  loginRepo.login(loginData: loginData );
}
