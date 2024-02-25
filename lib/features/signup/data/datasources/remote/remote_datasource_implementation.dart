import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/features/signup/data/datasources/remote/remote_datasource.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/model/user_model.dart';

class RemoteDataSoucresImplementation implements RemoteDataSource {
  final ApiManager apiManager;
  RemoteDataSoucresImplementation({required this.apiManager});
  @override
  Future<UserModel> signup({required UserData userData}) async {
    var user = await apiManager.signUpUser(userData);

    return user;
  }
}
