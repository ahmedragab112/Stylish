import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/rest_code.dart';
import 'package:stylehub/features/forgotpassword/data/model/update_password_body.dart';
import 'package:stylehub/features/forgotpassword/data/model/user_token_model.dart';
import 'package:stylehub/features/forgotpassword/data/model/verification_code.dart';
import 'package:stylehub/features/forgotpassword/data/repositories/data_repo.dart';

part 'forgotpassword_state.dart';
part 'forgotpassword_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotpasswordState> {
  final TextEditingController restPasswordController = TextEditingController();
  final ForgotPasswordDataRepo repo;
  final TextEditingController controller = TextEditingController();
  ForgotPasswordCubit({required this.repo})
      : super(const ForgotpasswordState.initial());

  Future<void> forgotPassword() async {
    emit(const ForgotpasswordState.loading());
    var data = await repo.forgotPassword(email: controller.text.trim());
    data.when(
        data: (data) =>
            emit(ForgotpasswordState.success(apiResponseModel: data)),
        error: (error) => emit(
            ForgotpasswordState.fail(apiResponseModel: error.apiErrorModel)));
  }

  Future<void> verifyRestCode() async {
    emit(const ForgotpasswordState.loading());
    var data = await repo.verifyRestCode(
        RestCodeModel(restCode: restPasswordController.text.trim()));
    data.when(
        data: (data) =>
            emit(ForgotpasswordState.successRestCode(apiResponseModel: data)),
        error: (error) => emit(ForgotpasswordState.failRestCode(
            apiResponseModel: error.apiErrorModel)));
  }

  Future<void> resetPassword() async {
    emit(const ForgotpasswordState.loading());
    var data = await repo.resetPassword(const UpdatePasswordBody(
        email: 'besohero79@gmail.com', password: 'ahmedragab123'));

    data.when(
        data: (data) =>
            emit(ForgotpasswordState.updateUserSuccess(userTokenModel: data)),
        error: (error) {
          log(error.apiErrorModel.message!);
          emit(
            ForgotpasswordState.updateUserFail(
              apiResponseModel: error.apiErrorModel,
            ),
          );
        });
  }
}
