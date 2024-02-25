part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
 final UserEntity userEntity;

  const LoginSuccess({required this.userEntity});
}

class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});
}
