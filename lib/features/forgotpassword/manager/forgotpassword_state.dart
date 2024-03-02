part of 'forgotpassword_cubit.dart';

@freezed
class ForgotpasswordState with _$ForgotpasswordState {
  const factory ForgotpasswordState.initial() = _Initial;
  const factory ForgotpasswordState.loading() = Loading;
  const factory ForgotpasswordState.success({required ApiResponseModel apiResponseModel}) = Success;
  const factory ForgotpasswordState.fail({required ApiResponseModel apiResponseModel}) = Fail;
}
