import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/error/error_handler.dart';
import 'package:stylehub/features/signup/data/datasources/remote/remote_datasource.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/signup/domain/repositories/signup_repo.dart';

class SignUpDataRepo implements SignUpRepo {
  final RemoteDataSource remoteDataSource;
  const SignUpDataRepo({required this.remoteDataSource});

  @override
  Future<ApiResponse<UserEntity>> signUp({required UserData userData}) async {
    try {
      var data = await remoteDataSource.signUp(userData: userData);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(
        errorHandler: ErrorHandler.handle(e),
      );
    }
  }
}
