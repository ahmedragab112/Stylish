import 'package:stylehub/core/utils/entity/singup_entitey.dart';

abstract class LoginRepo {
  Future<UserEntity> login({required String email, required String password});
}
