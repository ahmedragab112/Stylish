import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/wishlist_body.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/domain/usecases/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;
  ProductEntity? productInCategory;
  BrandsModel? brands;
  ProductEntity? homeProducts;
  int activeIndex = 0;
  ProductCategoryEntity? category;
  AddToWishListModel? addProductToWishList;
  AddToWishListModel? removeProductFromWishList;
  UserWishListModel? getUserWishList;
  int wishlistCount = 0;
  int pageIndex = 0;

  HomeCubit({required this.homeUseCase}) : super(HomeInitial());
  Future<void> getAllCategory() async {
    emit(HomeCategoryLoading());
    final result = await homeUseCase.getAllCategory();
    result.when(
        data: (data) {
          category = data;
          emit(HomeCategoryLoaded());
        },
        error: (error) =>
            emit(HomeCategoryError(error: error.apiErrorModel.message!)));
  }

  void changeSliderIndex(int index) {
    emit(HomeInitial());
    activeIndex = index;
    emit(ChangeSliderIndex());
  }

  void changePageIndex(int index) {
    emit(HomeInitial());
    pageIndex = index;
    emit(ChangePageIndex());
  }

  Future<void> getAllProducts() async {
    emit(GetAllProductLoading());
    final result = await homeUseCase.getAllProducts();
    result.when(data: (data) {
      emit(GetAllProductLoaded());
      homeProducts = data;
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(GetAllProductError(error: error.apiErrorModel.message!));
    });
  }

  Future<void> getProductInCategory({required String categoryId}) async {
    emit(GetProductInCategoryLoading());
    final result =
        await homeUseCase.getProductInCategory(categoryId: categoryId);
    result.when(data: (data) {
      emit(GetProductInCategoryLoaded());
      productInCategory = data;
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(GetProductInCategoryError(error: error.apiErrorModel.message!));
    });
  }

  Future<void> addToWishList({required WishListBody productId}) async {
    emit(AddToWishListLoading());
    final result = await homeUseCase.addToWishlist(productId: productId);
    result.when(data: (data) {
      if (getUserWishList?.count == 0) {
        emit(AddToWishListLoaded());
        addProductToWishList = data;
      } else {
        for (var i = 0; i < getUserWishList!.data!.length; i++) {
          if (getUserWishList!.data![i].id == productId.productId) {
            emit(const AddToWishListError(error: "Already in wishlist"));
            return;
          }
        }
        emit(AddToWishListLoaded());
        addProductToWishList = data;
      }
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(AddToWishListError(error: error.apiErrorModel.message!));
    });
  }

  Future<void> deleteWishList({required String productId}) async {
    emit(DeleteWishListLoading());
    final result = await homeUseCase.deleteWishlist(productId: productId);
    result.when(data: (data) {
      emit(DeleteWishListLoaded());
      removeProductFromWishList = data;
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(DeleteWishListError(error: error.apiErrorModel.message!));
    });
  }

  Future<void> getLoggedUserWishList() async {
    emit(GetUserWishListLoading());
    final result = await homeUseCase.getUserWishlist();
    result.when(data: (data) {
      emit(GetUserWishListLoaded());
      getUserWishList = data;
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(GetUserWishListError(error: error.apiErrorModel.message!));
    });
  }

  Future<void> getAllBrand() async {
    emit(GetAllBrandsLoading());
    final result = await homeUseCase.getAllBrands();
    result.when(data: (data) {
      emit(GetAllBrandsLoaded());
      brands = data;
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(GetAllBrandsError(error: error.apiErrorModel.message!));
    });
  }
}
