import 'package:stylehub/features/home/data/models/category_data.dart';

abstract class HomeRemoteDataSource {
   
  Future<CategoryData> getAllCategory();
}