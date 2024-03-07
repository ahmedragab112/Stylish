import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylehub/features/home/domain/entities/category_intiy.dart';
import 'package:stylehub/features/home/domain/usecases/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(HomeInitial());

 Future<void> getAllCategory() async {
    emit(HomeCategoryLoading());
    final result = await homeUseCase.getAllCategory();
    result.when(
        data: (data) => emit(HomeCategoryLoaded(category: data)),
        error: (error) =>
            emit(HomeCategoryError(error: error.apiErrorModel.message!)));
  }
}
