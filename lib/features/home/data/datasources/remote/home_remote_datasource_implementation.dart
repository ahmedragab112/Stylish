import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasoucre.dart';
import 'package:stylehub/features/home/data/models/category_data.dart';
import 'package:stylehub/features/home/data/models/product_data_model.dart';

class HomeDataSoucreImplementation implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeDataSoucreImplementation({required this.apiManager});

  @override
  Future<CategoryData> getAllCategory() async{
   return await apiManager.getAllCategories();
  }

  @override
  Future<ProductDataModel> getAllProduct() {
   return apiManager.getAllProducts();
  }
}
