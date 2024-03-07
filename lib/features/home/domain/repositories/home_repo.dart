import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';

abstract class HomeRepoDomain {

 Future<ApiResponse<CategoryEntity>> getAllCategory();
}