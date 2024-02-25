import 'package:stylehub/core/utils/model/user_model.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';

abstract class LoginRemoteDataSouce {
  Future<UserModel> login({required LoginData loginData});
}
