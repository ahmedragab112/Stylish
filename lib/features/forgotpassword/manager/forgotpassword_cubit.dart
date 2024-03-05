import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/cache/shared_prefrences.dart';
import 'package:stylehub/core/di/injection.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/core/utils/strings/app_strings.dart';
import 'package:stylehub/features/forgotpassword/data/model/rest_code.dart';
import 'package:stylehub/features/forgotpassword/data/model/update_password_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/user_token_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/verification_code.dart';
import 'package:stylehub/features/forgotpassword/data/repositories/data_repo.dart';

part 'forgotpassword_state.dart';
part 'forgotpassword_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotpasswordState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController restPasswordController = TextEditingController();
  final ForgotPasswordDataRepo repo;
  final TextEditingController controller = TextEditingController();

  bool isobscureText = true;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  ForgotPasswordCubit({required this.repo})
      : super(const ForgotpasswordState.initial());

  Future<void> sendEmailVerification({required String email}) async {
    emit(const ForgotpasswordState.loading());
    var data = await repo.forgotPassword(email: email.trim());
    data.when(
        data: (data) =>
            emit(ForgotpasswordState.success(apiResponseModel: data)),
        error: (error) => emit(
            ForgotpasswordState.fail(apiResponseModel: error.apiErrorModel)));
  }

  Future<void> verifyRestCode({required String code}) async {
    emit(const ForgotpasswordState.loadingRestCode());
    var data = await repo.verifyRestCode(RestCodeModel(restCode: code.trim()));
    data.when(
        data: (data) =>
            emit(ForgotpasswordState.successRestCode(apiResponseModel: data)),
        error: (error) => emit(ForgotpasswordState.failRestCode(
            apiResponseModel: error.apiErrorModel)));
  }

  void changeObscureText() {
    emit(const ForgotpasswordState.initial());
    isobscureText = !isobscureText;
    emit(const ForgotpasswordState.changeVisibility());
  }

  Future<void> resetPassword() async {
    emit(const ForgotpasswordState.updateUserLoading());
    var data = await repo.resetPassword(UpdatePasswordBody(
        email: emailController.text, password: passwordController.text));

    data.when(data: (data) async {
      await locator<CacheHelper>()
          .setInstance(data: data.token, key: AppStrings.cacheKeyUserToken);

      emit(ForgotpasswordState.updateUserSuccess(userTokenModel: data));
    }, error: (error) {
      log(error.apiErrorModel.message!);
      emit(
        ForgotpasswordState.updateUserFail(
          apiResponseModel: error.apiErrorModel,
        ),
      );
    });
  }
}
