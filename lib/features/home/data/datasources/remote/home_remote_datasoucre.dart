import 'package:stylehub/core/utils/model/user_model.dart';
import 'package:stylehub/features/home/data/models/add_product_to_cart.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/category_data.dart';
import 'package:stylehub/features/home/data/models/clear_cart_iteam_model.dart';
import 'package:stylehub/features/home/data/models/get_logged_user_cart.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/password_model.dart';
import 'package:stylehub/features/home/data/models/product_data_model.dart';
import 'package:stylehub/features/home/data/models/spacific_brand_model.dart';
import 'package:stylehub/features/home/data/models/spacific_iteam_model.dart';
import 'package:stylehub/features/home/data/models/wishlist_body.dart';

abstract class HomeRemoteDataSource {
  Future<CategoryData> getAllCategory();
  Future<ProductDataModel> getAllProduct();
  Future<ProductDataModel> getProductInCategory({required String categoryId});
    Future<ProductDataModel> getProductsInBrand({required String brandId});
  Future<AddToWishListModel> addToWishList({required WishListBody productId});
  Future<AddToWishListModel> deleteWishList({required String productId});

  Future<UserWishListModel> getUserWishList();

  Future<BrandsModel> getAllBrands();
  Future<AddProductToCartModel> addProductToCart({required String productId});
  Future<GetLoggedUserCartModel> getLoggedUserCart();

  Future<GetLoggedUserCartModel> updateWishList({required String productId , required String count});

  Future<GetLoggedUserCartModel> deleteCartIteam({required String id});

  Future<ClearCartModel> clearUserCart();
Future<SpacificIteamModel> getSpecificProductIteam(String id);
Future<SpacificBrandDataModel> getSpecificBrandIteam(String id);
Future<UserModel> updateLoggedUserData({ required PasswordModel passwordModel});
}
