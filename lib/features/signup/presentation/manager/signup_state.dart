part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success({required UserEntity userEntity}) = Success;
  const factory SignupState.error({required String message}) = Error;
   const factory SignupState.changeObsuerText() = ChangeObsuerText;
   
  
}
