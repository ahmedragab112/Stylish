import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stylehub/core/cache/user_data_model.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/home/data/models/add_product_to_cart.dart';
import 'package:stylehub/features/home/data/models/add_towishlist_model.dart';
import 'package:stylehub/features/home/data/models/brands_model.dart';
import 'package:stylehub/features/home/data/models/get_logged_user_cart.dart';
import 'package:stylehub/features/home/data/models/get_user_wishlist_model.dart';
import 'package:stylehub/features/home/data/models/password_model.dart';
import 'package:stylehub/features/home/data/models/spacific_brand_model.dart';
import 'package:stylehub/features/home/data/models/spacific_iteam_model.dart';
import 'package:stylehub/features/home/data/models/wishlist_body.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/domain/usecases/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;
    final forgotPasswordValidationKey = GlobalKey<FormState>();
  TextEditingController changePasswordNewPasswordController = TextEditingController();
  TextEditingController changePasswordNewPasswordConfirmController = TextEditingController();

  TextEditingController changePasswordController = TextEditingController();


  GetLoggedUserCartModel? cartData;
  ProductEntity? productInCategory;
  BrandsModel? brands;
  UserData? userData;
  UserEntity? userEntity;
  ProductEntity? homeProducts;
  AddProductToCartModel? addProductToCartModel;
  int activeIndex = 0;
  int cartCount = 0;
  ProductCategoryEntity? category;
  AddToWishListModel? addProductToWishList;
  AddToWishListModel? removeProductFromWishList;
  UserWishListModel? getUserWishList;
  int wishlistCount = 0;
  int pageIndex = 0;
  int activeProductIndex = 0;
  double totalPrice = 0;
  SpacificIteamModel? spacificIteamModel;
  SpacificBrandDataModel? spacificBrandDataModel;
  HomeCubit({required this.homeUseCase}) : super(HomeInitial());
  ProductEntity? productInBrand;
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
        wishlistCount++;
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
        wishlistCount++;
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
      wishlistCount--;
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
      wishlistCount = data.count ?? 0;
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

  void changeProductSliderIndex(int index) {
    emit(HomeInitial());
    activeProductIndex = index;
    emit(ChangeProductSliderIndex());
  }

  Future<void> getLoggedUserCartData() async {
    emit(GetLoggedUserDataLoading());
    var result = await homeUseCase.getLoggedUserCart();
    result.when(
      data: (data) {
        cartData = data;
        cartCount = int.parse((data.numOfCartItems ?? 0).toString());
        totalPrice = data.data?.totalCartPrice?.toDouble() ?? 0;
        emit(GetLoggedUserDataLoaded());
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        log('---------------------------------------------------------------------');
        emit(
            GetLoggedUserDataError(error: errorHandler.apiErrorModel.message!));
      },
    );
  }

  Future<void> addToCart({required String productId}) async {
    emit(AddToCartLoading());
    var result = await homeUseCase.addProductToCart(id: productId);
    result.when(
      data: (data) async {
        addProductToCartModel = data;
        cartCount++;
        emit(AddToCartLoaded());
        await getLoggedUserCartData();
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        emit(AddToCartError(error: errorHandler.apiErrorModel.message!));
      },
    );
  }

  Future<void> deleteCartIteam({required String productId}) async {
    emit(DeleteCartLoading());
    var result = await homeUseCase.deleteCartIteam(id: productId);
    result.when(
      data: (data) async {
        cartData = data;
        cartCount--;
        emit(DeleteCartLoaded());
        await getLoggedUserCartData();
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        emit(DeleteCartError(error: errorHandler.apiErrorModel.message!));
      },
    );
  }

  Future<void> updateCartIteam(
      {required String productId, required int count}) async {
    emit(UpdateCartLoading());
    var result = await homeUseCase.updateCart(
        productId: productId, count: count.toString());
    result.when(
      data: (data) async {
        cartData = data;
        cartCount = int.parse((data.numOfCartItems ?? 0).toString());
        emit(UpdateCartLoaded());
        await getLoggedUserCartData();
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        emit(UpdateCartError(error: errorHandler.apiErrorModel.message!));
      },
    );
  }

  Future<void> clearCartIteams() async {
    emit(GetLoggedUserDataLoading());
    var result = await homeUseCase.clearUserCart();
    result.when(
      data: (data) async {
        cartCount = 0;
        emit(GetLoggedUserDataLoaded());
        await getLoggedUserCartData();
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        emit(
            GetLoggedUserDataError(error: errorHandler.apiErrorModel.message!));
      },
    );
  }

  int increementProductCartCount(
      int productAvailableCount, int productCartIteamCount) {
    emit(HomeInitial());
    if (productCartIteamCount <= productAvailableCount) {
      productCartIteamCount++;
    }
    emit(IncreementCartIteamCount());
    return productCartIteamCount;
  }

  int decreementProductCartCount(int productCartIteamCount) {
    emit(HomeInitial());
    if (productCartIteamCount > 0) {
      productCartIteamCount--;
    }
    emit(DecreementCartIteamCount());
    return productCartIteamCount;
  }

  Future<void> getSpacifcIteam({required String productId}) async {
    emit(GetSpacificIteamLoading());
    var result = await homeUseCase.getSpecificProductIteam(productId);
    result.when(
      data: (data) async {
        spacificIteamModel = data;
        emit(GetSpacificIteamLoaded());
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        emit(GetSpacificIteamError(error: errorHandler.apiErrorModel.message!));
      },
    );
  }

  Future<void> getSpacificBrand({required String brandId}) async {
    emit(GetSpacificBrandLoading());
    var result = await homeUseCase.getSpacificBrand(brandId);
    result.when(
      data: (data) async {
        spacificBrandDataModel = data;
        emit(GetSpacificBrandLoaded());
      },
      error: (errorHandler) {
        log(errorHandler.apiErrorModel.message!);
        emit(GetSpacificBrandError(error: errorHandler.apiErrorModel.message!));
      },
    );
  }

  Future<void> getProductInBrand({required String brandId}) async {
    emit(GetProductInBrandLoading());
    final result = await homeUseCase.getProductsInBrand(brandId: brandId);
    result.when(data: (data) {
      productInBrand = data;
      emit(GetProductInBrandLoaded());
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(GetProductInBrandError(error: error.apiErrorModel.message!));
    });
  }

  void getUserData() {
    emit(HomeInitial());
    var user = userBox.values.toList();
    userData = user[0];
    log('-------------------------------------------------------------------------------');
    log(userData!.name!);
    log('------------------------------------------------------------------------------');
    log('-------------------------------------------------------------------------------');
    log(userData!.email!);
    log('------------------------------------------------------------------------------');
    emit(GetUserDataLoaded());
  }

  Future<void> updateLoggedUserPassword() async {
    emit(UpdateLoggedUserPasswordLoading());
    final result = await homeUseCase.updateLoggedUserPassword(
        passwordModel: PasswordModel(
          currentPassword: changePasswordController.text, 
          password:changePasswordNewPasswordController.text , 
          rePassword:changePasswordNewPasswordConfirmController.text 
        ));
    result.when(data: (data) {
      userEntity = data;
      emit(UpdateLoggedUserPasswordLoaded());
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(UpdateLoggedUserPasswordError(error: error.apiErrorModel.message!));
    });
  }

}
