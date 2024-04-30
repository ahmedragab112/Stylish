import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/category_data.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/product_data_model.dart';
import 'package:stylehub/features/home/data/models/wishlist_body.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryData> getAllCategory();
  Future<ProductDataModel> getAllProduct();
  Future<ProductDataModel> getProductInCategory({required String categoryId});
  Future<AddToWishListModel> addToWishList({required WishListBody productId});
  Future<AddToWishListModel> deleteWishList({required String productId});

  Future<UserWishListModel> getUserWishList();
  
  Future<BrandsModel> getAllBrands();


}
