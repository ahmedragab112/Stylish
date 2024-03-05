part of 'forgotpassword_cubit.dart';

@freezed
class ForgotpasswordState with _$ForgotpasswordState {
  const factory ForgotpasswordState.initial() = _Initial;
  const factory ForgotpasswordState.loading() = Loading;
  const factory ForgotpasswordState.success(
      {required ApiResponseModel apiResponseModel}) = Success;
  const factory ForgotpasswordState.fail(
      {required ApiResponseModel apiResponseModel}) = Fail;

  const factory ForgotpasswordState.loadingRestCode() = LoadingRestCode;
  const factory ForgotpasswordState.successRestCode(
      {required VerificationCodeModel apiResponseModel}) = SuccessRestCode;
  const factory ForgotpasswordState.failRestCode(
      {required ApiResponseModel apiResponseModel}) = FailRestCode;

const factory ForgotpasswordState.updateUserLoading() = UpdateUserLoading;
  const factory ForgotpasswordState.updateUserSuccess(
      {required UserTokenModel userTokenModel}) = UpdateUserSuccess;
  const factory ForgotpasswordState.updateUserFail(
      {required ApiResponseModel apiResponseModel}) = UpdateUserFail;

const factory ForgotpasswordState.changeVisibility() = ChangeVisibility;
}
