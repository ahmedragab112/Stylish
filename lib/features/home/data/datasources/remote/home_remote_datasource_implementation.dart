import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasoucre.dart';
import 'package:stylehub/features/home/data/models/category_data.dart';

class HomeDataSoucreImplementation implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeDataSoucreImplementation({required this.apiManager});

  @override
  Future<CategoryData> getAllCategory() async{
   return await apiManager.getAllCategories();
  }
}
