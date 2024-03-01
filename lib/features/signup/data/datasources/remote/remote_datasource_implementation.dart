import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/features/signup/data/datasources/remote/remote_datasource.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/model/user_model.dart';

class SignUpRemoteDataSoucresImplementation implements RemoteDataSource {
  final ApiManager apiManager;
  const SignUpRemoteDataSoucresImplementation({required this.apiManager});
  @override
  Future<UserModel> signUp({required UserData userData}) async {
    try {
      var user = await apiManager.signUpUser(userData);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
