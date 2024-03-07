import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/error/error_handler.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasoucre.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/repositories/home_repo.dart';

class HomeDataRepo implements HomeRepoDomain {
  final HomeRemoteDataSource homeDataSoucre;
  const HomeDataRepo({required this.homeDataSoucre});
  @override
  Future<ApiResponse<CategoryEntity>> getAllCategory() async {
    try {
      var data = await homeDataSoucre.getAllCategory();

      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
