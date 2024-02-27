import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/utils/model/user_model.dart';
import 'package:stylehub/features/login/data/datasources/remote_datasoucre.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';

class LoginRemoteDataSoucreImplementation implements LoginRemoteDataSouce {
  ApiManager apiManager;

  LoginRemoteDataSoucreImplementation({required this.apiManager});
  @override
  Future<UserModel> login({required LoginData loginData}) async => await apiManager.loginUser(loginData);
}
