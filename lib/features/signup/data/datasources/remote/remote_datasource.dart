import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/features/signup/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> signup({required UserData userData});
}
