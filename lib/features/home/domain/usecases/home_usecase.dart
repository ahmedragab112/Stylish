import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/domain/repositories/home_repo.dart';

class HomeUseCase {
  final HomeRepoDomain homeRepoDomain;

  const HomeUseCase({required this.homeRepoDomain});

  Future<ApiResponse<ProductCategoryEntity>> getAllCategory() async =>
      await homeRepoDomain.getAllCategory();


  Future<ApiResponse<ProductEntity>> getAllProducts() async =>
      await homeRepoDomain.getAllProducts();


  Future<ApiResponse<ProductEntity>> getProductInCategory(
          {required String categoryId}) async =>
      await homeRepoDomain.getProductInCategory(categoryId: categoryId);
}
