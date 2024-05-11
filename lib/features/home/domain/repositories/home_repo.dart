import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/home/data/models/add_product_to_cart.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/clear_cart_iteam_model.dart';
import 'package:stylehub/features/home/data/models/get_logged_user_cart.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/password_model.dart';
import 'package:stylehub/features/home/data/models/spacific_brand_model.dart';
import 'package:stylehub/features/home/data/models/spacific_iteam_model.dart';
import 'package:stylehub/features/home/data/models/wishlist_body.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';

abstract class HomeRepoDomain {
  Future<ApiResponse<ProductCategoryEntity>> getAllCategory();
  Future<ApiResponse<ProductEntity>> getAllProducts();
  Future<ApiResponse<ProductEntity>> getProductInCategory(
      {required String categoryId});

  Future<ApiResponse<AddToWishListModel>> addToWishList(
      {required WishListBody productId});

  Future<ApiResponse<AddToWishListModel>> deleteWishList(
      {required String productId});

  Future<ApiResponse<UserWishListModel>> getUserWishList();

  Future<ApiResponse<BrandsModel>> getAllBrands();
  Future<ApiResponse<GetLoggedUserCartModel>> getLoggedUserCart();

  Future<ApiResponse<AddProductToCartModel>> addProductToCart(
      {required String id});

  Future<ApiResponse<ClearCartModel>> clearUserCart();

  Future<ApiResponse<GetLoggedUserCartModel>> updateCart(
      {required String productId, required String count});

  Future<ApiResponse<GetLoggedUserCartModel>> deleteCartIteam(
      {required String id});
  Future<ApiResponse<SpacificIteamModel>> getSpecificProductIteam(String id);
  Future<ApiResponse<SpacificBrandDataModel>> getSpacificBrand(String id);
  Future<ApiResponse<ProductEntity>> getProductsInBrand(
      {required String brandId});
  Future<ApiResponse<UserEntity>> updateLoggedUserPassword(
      {required PasswordModel passwordModel});
}
