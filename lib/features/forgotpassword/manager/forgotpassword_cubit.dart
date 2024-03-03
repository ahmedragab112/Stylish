import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stylehub/core/error/error_model.dart';
import 'package:stylehub/features/forgotpassword/data/repositories/data_repo.dart';

part 'forgotpassword_state.dart';
part 'forgotpassword_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotpasswordState> {
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
}
