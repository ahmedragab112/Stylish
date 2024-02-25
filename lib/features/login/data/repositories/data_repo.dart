import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/error/error_handler.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/login/data/datasources/remote_datasoucre.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/domain/repositories/login_domainrepo.dart';

class LoginDataRepo implements LoginRepo {
  LoginRemoteDataSouce loginRemoteDataSouce;

  LoginDataRepo({required this.loginRemoteDataSouce});

  @override
  Future<ApiResponse<UserEntity>> login({required LoginData loginData}) async {
    try {
      var data = await loginRemoteDataSouce.login(loginData: loginData);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(
        errorHandler: ErrorHandler.handle(e),
      );
    }
  }
}
