import 'package:stylehub/core/api/api_manger.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasoucre.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/category_data.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/product_data_model.dart';
import 'package:stylehub/features/home/data/models/wishlist_body.dart';

class HomeDataSoucreImplementation implements HomeRemoteDataSource {
  final ApiManager apiManager;

  const HomeDataSoucreImplementation({required this.apiManager});

  @override
  Future<CategoryData> getAllCategory() async =>
      await apiManager.getAllCategories();

  @override
  Future<ProductDataModel> getAllProduct() async =>
      await apiManager.getProducts();

  @override
  Future<ProductDataModel> getProductInCategory(
          {required String categoryId}) async =>
      await apiManager.getProducts(productsInCategory: categoryId);

  @override
  Future<AddToWishListModel> addToWishList(
          {required WishListBody productId}) async =>
      await apiManager.addToWishList(
          locator<CacheHelper>().getString(AppStrings.cacheKeyUserToken),
          productId);

  @override
  Future<AddToWishListModel> deleteWishList(
          {required String productId}) async =>
      await apiManager.deleteWishList(
        locator<CacheHelper>().getString(AppStrings.cacheKeyUserToken),
        productId,
      );

  @override
  Future<UserWishListModel> getUserWishList() async =>
      await apiManager.getUserWishList(
        locator<CacheHelper>().getString(AppStrings.cacheKeyUserToken),
      );

  @override
  Future<BrandsModel> getAllBrands() async => await apiManager.getAllBrands();
}
