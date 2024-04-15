import 'dart:developer';

import 'package:stylehub/core/api/api_response.dart';
import 'package:stylehub/core/error/error_handler.dart';
import 'package:stylehub/features/home/data/datasources/remote/home_remote_datasoucre.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
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
}
