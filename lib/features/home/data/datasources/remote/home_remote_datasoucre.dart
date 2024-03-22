import 'package:stylehub/features/home/data/models/category_data.dart';
import 'package:stylehub/features/home/data/models/product_data_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryData> getAllCategory();
  Future<ProductDataModel> getAllProduct();
}
