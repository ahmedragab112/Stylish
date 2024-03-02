import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/error/error_handler.dart';
import 'package:stylehub/features/forgotpassword/data/service/remote_datasoucre.dart';

import '../../../../core/error/error_model.dart';

class ForgotPasswordDataRepo {
  final RemoteDataSource dataSource;
  const ForgotPasswordDataRepo({required this.dataSource});
  Future<ApiResponse<ApiResponseModel>> forgotPassword(
      {required String email}) async {
    try {
      var data = await dataSource.forgotPassword(email: email);
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
