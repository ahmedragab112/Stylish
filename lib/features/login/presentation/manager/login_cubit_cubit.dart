
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';

part 'login_cubit_state.dart';
part 'login_cubit_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  bool isobscureText = false;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
  LoginCubit({required this.loginUseCase}) : super(const LoginState.initial());

  Future<void> login() async {
    var data = await loginUseCase.login(loginData: LoginData(
      email: emailController.text,
      password: passwordController.text
    ));
    data.when(
        data: (data) => emit((LoginState.success(userEntity: data))),
        error: (error) {
        log(error.apiErrorModel.message!);
          emit(LoginState.fail(message: error.apiErrorModel.message!));
        });
  }
 void changeObscureText(){
    emit(const LoginState.loading());
    isobscureText = !isobscureText;
    emit(const LoginState.changeObsuerText());
  }
}
