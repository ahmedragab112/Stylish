part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.success({required UserEntity userEntity}) =
      Success;
  const factory LoginState.fail({required String message}) = Fail;
  const factory LoginState.loading() = Loading;
  const factory LoginState.changeObsuerText() = _ChangeObsuerText;
    const factory LoginState.cacheUserData() = _CacheUserData;

}
