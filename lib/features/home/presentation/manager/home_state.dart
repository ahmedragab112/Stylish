part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeCategoryLoading extends HomeState {}

class HomeCategoryLoaded extends HomeState {
  final CategoryEntity category;
  const HomeCategoryLoaded({required this.category});
}

class HomeCategoryError extends HomeState {
  final String error;
  const HomeCategoryError({required this.error});
}