import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/cache/user_data_model.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/utils/constant/app_constant.dart';
import 'package:stylehub/core/utils/entity/singup_entitey.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  var formKey = GlobalKey<FormState>();
  final LoginUseCase loginUseCase;
  UserData? userData;
  bool isobscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit({required this.loginUseCase}) : super(const LoginState.initial());

  Future<void> login() async {
    emit(const LoginState.loading());
    var data = await loginUseCase.login(
        loginData: LoginData(
            email: emailController.text.trim(),
            password: passwordController.text.trim()));
    data.when(data: (userEntity) async {
      await Future.wait([
        locator<CacheHelper>().setInstance(
            data: userEntity.token, key: AppStrings.cacheKeyUserToken),
        userBox.add(UserData(
          email: userEntity.user!.email,
          name: userEntity.user!.name,
        ))
      ]).whenComplete(() {
        log('complete caching ------------------------------------------------------');
        emit((LoginState.success(userEntity: userEntity)));
      });
    }, error: (error) {
      emit(LoginState.fail(message: error.apiErrorModel.message!));
    });
  }

  void changeObscureText() {
    emit(const LoginState.initial());
    isobscureText = !isobscureText;
    emit(const LoginState.changeObsuerText());
  }
}
