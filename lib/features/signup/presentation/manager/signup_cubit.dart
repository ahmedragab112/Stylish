import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/signup/data/models/user_data.dart';
import 'package:stylehub/features/signup/domain/usecases/signup_usecase.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signUpUsecase})
      : super(const SignupState.initial());
  bool isObscure = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final SignUpUsecase signUpUsecase;
  Future<void> signUp() async {
    emit(const SignupState.loading());
    var data = await signUpUsecase.call(
        userData: UserData(
            name: nameController.text,
            rePassword: rePasswordController.text,
            phone: phoneController.text,
            email: emailController.text,
            password: passwordController.text));
    data.when(
        data: (data) => emit(SignupState.success(userEntity: data)),
        error: (error) =>
            emit(SignupState.error(message: error.apiErrorModel.message!)));
  }

  void changeObscureText() {
    emit(const SignupState.initial());
    isObscure = !isObscure;
    emit(const SignupState.changeObsuerText());
  }
}
