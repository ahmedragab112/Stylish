import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/model/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> signUp({required UserData userData});
}
