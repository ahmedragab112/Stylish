import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/features/signup/domain/entities/singup_entitey.dart';
import 'package:stylehub/features/signup/domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignUpUsecase signUpUsecase;
  SignupCubit({required this.signUpUsecase}) : super(SignupInitial());
  Future<void> signUp() async {
    log('here');
    emit(SignupLoading());
    var data = await signUpUsecase.call(
        userData: UserData(
            name: 'AHMED123213',
            rePassword: 'ahmedragab123',
            phone: '01096626385',
            email: 'vvvvvvvvvvvvvvvvvv112222020@gmail.com',
            password: 'ahmedragab123'));
    data.when(
        data: (data) => emit(SignupSuccess(userEntity: data)),
        error: (error) =>
            emit(SignupError(message: error.apiErrorModel.message!)));
  }
}
