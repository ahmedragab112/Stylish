import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/repositories/home_repo.dart';

class HomeUseCase {
 final HomeRepoDomain homeRepoDomain;

const  HomeUseCase({required this.homeRepoDomain});

  Future<ApiResponse<CategoryEntity>> getAllCategory() async => await homeRepoDomain.getAllCategory();
}
