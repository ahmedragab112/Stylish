import 'package:stylehub/core/error/error_model.dart';

abstract class RemoteDataSource {
  Future<ApiResponseModel> forgotPassword({required String email});
}
