import 'dart:developer';

import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/error/error_handler.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasoucre.dart';
import 'package:stylehub/features/home/data/models/add_product_to_cart.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/clear_cart_iteam_model.dart';
import 'package:stylehub/features/home/data/models/get_logged_user_cart.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/wishlist_body.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/domain/repositories/home_repo.dart';

class HomeDataRepo implements HomeRepoDomain {
  final HomeRemoteDataSource homeDataSoucre;
  const HomeDataRepo({required this.homeDataSoucre});
  @override
  Future<ApiResponse<ProductCategoryEntity>> getAllCategory() async {
    try {
      var data = await homeDataSoucre.getAllCategory();
      return ApiResponse.data(data);
    } catch (e) {
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<ProductEntity>> getAllProducts() async {
    try {
      var data = await homeDataSoucre.getAllProduct();
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<ProductEntity>> getProductInCategory(
      {required String categoryId}) async {
    try {
      var data =
          await homeDataSoucre.getProductInCategory(categoryId: categoryId);
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<AddToWishListModel>> addToWishList(
      {required WishListBody productId}) async {
    try {
      var data = await homeDataSoucre.addToWishList(productId: productId);
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<AddToWishListModel>> deleteWishList(
      {required String productId}) async {
    try {
      var data = await homeDataSoucre.deleteWishList(productId: productId);
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<UserWishListModel>> getUserWishList() async {
    try {
      var data = await homeDataSoucre.getUserWishList();
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<BrandsModel>> getAllBrands() async {
    try {
      var data = await homeDataSoucre.getAllBrands();
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<GetLoggedUserCartModel>> getLoggedUserCart() async {
    try {
      var data = await homeDataSoucre.getLoggedUserCart();
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<AddProductToCartModel>> addProductToCart(
      {required String id}) async {
    try {
      var data = await homeDataSoucre.addProductToCart(productId: id);
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<ClearCartModel>> clearUserCart() async {
    try {
      var data = await homeDataSoucre.clearUserCart();
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<GetLoggedUserCartModel>> deleteCartIteam(
      {required String id}) async {
    try {
      var data = await homeDataSoucre.deleteCartIteam(id: id);
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResponse<GetLoggedUserCartModel>> updateCart(
      {required String productId, required String count}) async {
    try {
      var data = await homeDataSoucre.updateWishList(
          productId: productId, count: count);
      return ApiResponse.data(data);
    } catch (e) {
      log(e.toString());
      return ApiResponse.error(errorHandler: ErrorHandler.handle(e));
    }
  }
}
