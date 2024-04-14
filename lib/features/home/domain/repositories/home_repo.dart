import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';

abstract class HomeRepoDomain {
  Future<ApiResponse<ProductCategoryEntity>> getAllCategory();
  Future<ApiResponse<ProductEntity>> getAllProducts();
  Future<ApiResponse<ProductEntity>>getProductInCategory ({required String categoryId});
}
