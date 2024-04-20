import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
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
}
