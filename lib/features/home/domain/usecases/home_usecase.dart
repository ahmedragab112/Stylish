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
import 'package:stylehub/features/home/domain/repositories/home_repo.dart';

class HomeUseCase {
  final HomeRepoDomain homeRepoDomain;

  const HomeUseCase({required this.homeRepoDomain});

  Future<ApiResponse<ProductCategoryEntity>> getAllCategory() async =>
      await homeRepoDomain.getAllCategory();

  Future<ApiResponse<ProductEntity>> getAllProducts() async =>
      await homeRepoDomain.getAllProducts();

  Future<ApiResponse<ProductEntity>> getProductInCategory(
          {required String categoryId}) async =>
      await homeRepoDomain.getProductInCategory(categoryId: categoryId);

  Future<ApiResponse<AddToWishListModel>> addToWishlist(
          {required WishListBody productId}) async =>
      await homeRepoDomain.addToWishList(productId: productId);

  Future<ApiResponse<AddToWishListModel>> deleteWishlist(
          {required String productId}) async =>
      await homeRepoDomain.deleteWishList(productId: productId);

  Future<ApiResponse<UserWishListModel>> getUserWishlist() async =>
      await homeRepoDomain.getUserWishList();

  Future<ApiResponse<BrandsModel>> getAllBrands() async =>
      await homeRepoDomain.getAllBrands();

  Future<ApiResponse<GetLoggedUserCartModel>> getLoggedUserCart() async =>
      await homeRepoDomain.getLoggedUserCart();

  Future<ApiResponse<AddProductToCartModel>> addProductToCart(
          {required String id}) async =>
      await homeRepoDomain.addProductToCart(id: id);

  Future<ApiResponse<ClearCartModel>> clearUserCart() async =>
      await homeRepoDomain.clearUserCart();

  Future<ApiResponse<GetLoggedUserCartModel>> updateCart(
          {required String productId, required String count}) async =>
      await homeRepoDomain.updateCart(productId: productId, count: count);

  Future<ApiResponse<GetLoggedUserCartModel>> deleteCartIteam(
          {required String id}) async =>
      await homeRepoDomain.deleteCartIteam(id: id);

  Future<ApiResponse<SpacificIteamModel>> getSpecificProductIteam(
          String id) async =>
      await homeRepoDomain.getSpecificProductIteam(id);

  Future<ApiResponse<SpacificBrandDataModel>> getSpacificBrand(
          String id) async =>
      await homeRepoDomain.getSpacificBrand(id);

  Future<ApiResponse<ProductEntity>> getProductsInBrand(
          {required String brandId}) async =>
      await homeRepoDomain.getProductsInBrand(brandId: brandId);

  Future<ApiResponse<UserEntity>> updateLoggedUserPassword(
          {required PasswordModel passwordModel}) async =>
      await homeRepoDomain.updateLoggedUserPassword(
          passwordModel: passwordModel);
}
