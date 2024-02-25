import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  login({required LoginData data}) async {
    await loginUseCase.login(loginData: data);
  }
}
