import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/forgotpassword_body.dart';
import 'package:stylehub/features/forgotpassword/data/service/remote_datasoucre.dart';

class ForgotPasswordRemoteDataSourceImplementation implements RemoteDataSource {
  final ApiManager apiManager;
  const ForgotPasswordRemoteDataSourceImplementation(
      {required this.apiManager});
  @override
  Future<ApiResponseModel> forgotPassword({required String email}) async {
    return await apiManager.forgotPassword( ForgotPasswordBody(email: email));
  }
}
