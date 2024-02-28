part of 'login_cubit_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.success({required UserEntity userEntity}) = _Success;
  const factory LoginState.fail( {required String message}) = _Fail;
  const factory LoginState.loading() = _Loading;
    const factory LoginState.changeObsuerText() = _ChangeObsuerText;
}
