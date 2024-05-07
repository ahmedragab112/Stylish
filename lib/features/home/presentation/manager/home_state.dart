part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeCategoryLoading extends HomeState {}

class HomeCategoryLoaded extends HomeState {}

class HomeCategoryError extends HomeState {
  final String error;
  const HomeCategoryError({required this.error});
}

class ChangeSliderIndex extends HomeState {}

class GetAllProductLoading extends HomeState {}

class GetAllProductLoaded extends HomeState {}

class GetAllProductError extends HomeState {
  final String error;
  const GetAllProductError({required this.error});
}

class ChangePageIndex extends HomeState {}

class GetProductInCategoryLoading extends HomeState {}

class GetProductInCategoryLoaded extends HomeState {}

class GetProductInCategoryError extends HomeState {
  final String error;
  const GetProductInCategoryError({required this.error});
}

class AddToWishListLoading extends HomeState {}

class AddToWishListLoaded extends HomeState {}

class AddToWishListError extends HomeState {
  final String error;
  const AddToWishListError({required this.error});
}

class DeleteWishListLoading extends HomeState {}

class DeleteWishListLoaded extends HomeState {}

class DeleteWishListError extends HomeState {
  final String error;
  const DeleteWishListError({required this.error});
}

class GetUserWishListLoading extends HomeState {}

class GetUserWishListLoaded extends HomeState {}

class GetUserWishListError extends HomeState {
  final String error;
  const GetUserWishListError({required this.error});
}



class GetAllBrandsLoading extends HomeState {}

class GetAllBrandsLoaded extends HomeState {}

class GetAllBrandsError extends HomeState {
  final String error;
  const GetAllBrandsError({required this.error});
}
class ChangeProductSliderIndex extends HomeState{}



class GetLoggedUserDataLoading extends HomeState {}
class GetLoggedUserDataLoaded extends HomeState {}
class GetLoggedUserDataError extends HomeState {
   final String error;
  const GetLoggedUserDataError({required this.error});
}
class AddToCartLoading extends HomeState {}
class AddToCartLoaded extends HomeState {}
class AddToCartError extends HomeState {
   final String error;
  const AddToCartError({required this.error});
}
class DeleteCartLoading extends HomeState {}
class DeleteCartLoaded extends HomeState {}
class DeleteCartError extends HomeState {
   final String error;
  const DeleteCartError({required this.error});
}
class IncreementCartIteamCount extends HomeState {}
class DecreementCartIteamCount extends HomeState {}

class UpdateCartLoading extends HomeState {}
class UpdateCartLoaded extends HomeState {}
class UpdateCartError extends HomeState {
   final String error;
  const UpdateCartError({required this.error});
}


class GetSpacificIteamLoading extends HomeState {}
class GetSpacificIteamLoaded extends HomeState {}
class GetSpacificIteamError extends HomeState {
   final String error;
  const GetSpacificIteamError({required this.error});
}


class GetSpacificBrandLoading extends HomeState {}
class GetSpacificBrandLoaded extends HomeState {}
class GetSpacificBrandError extends HomeState {
   final String error;
  const GetSpacificBrandError({required this.error});
}

class GetProductInBrandLoading extends HomeState {}
class GetProductInBrandLoaded extends HomeState {}
class GetProductInBrandError extends HomeState {
   final String error;
  const GetProductInBrandError({required this.error});
}

