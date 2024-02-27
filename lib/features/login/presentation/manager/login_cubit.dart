import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
 Future<void> login({required LoginData loginData}) async {
    var data = await loginUseCase.login(loginData: loginData);
    data.when(
      data: (data) => emit(LoginSuccess(userEntity: data)),
      error: (error) => emit(LoginError(message: error.apiErrorModel.message!)),
    );
  }
}
