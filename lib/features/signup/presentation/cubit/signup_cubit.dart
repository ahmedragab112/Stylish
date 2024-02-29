import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/signup/domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignUpUsecase signUpUsecase;
  SignupCubit({required this.signUpUsecase}) : super(SignupInitial());
  Future<void> signUp() async {
    emit(SignupLoading());
    var data = await signUpUsecase.call(
        userData: UserData(
            name: 'AHMED123213213213',
            rePassword: 'ahmedragab12333',
            phone: '01096626385',
            email: 'vvvvvvvvvvvvvvvvvv11222202032323@gmail.com',
            password: 'ahmedragab12333'));
    data.when(
        data: (data) => emit(SignupSuccess(userEntity: data)),
        error: (error) =>
            emit(SignupError(message: error.apiErrorModel.message!)));
  }
}
