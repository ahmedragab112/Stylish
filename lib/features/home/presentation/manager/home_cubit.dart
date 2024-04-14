import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/entities/product_entity.dart';
import 'package:stylehub/features/home/domain/usecases/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;
  ProductEntity? productInCategory;
  ProductEntity? homeProducts;
  int activeIndex = 0;
  ProductCategoryEntity? category;
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
}
