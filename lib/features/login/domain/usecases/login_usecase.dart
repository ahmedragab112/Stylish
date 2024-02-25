import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/login/domain/repositories/login_domainrepo.dart';

class LoginUseCase {
  LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});
  Future<UserEntity> login(
      {required String email, required String password}) async {
    var data = await loginRepo.login(email: email, password: password);
    return data;
  }
}
