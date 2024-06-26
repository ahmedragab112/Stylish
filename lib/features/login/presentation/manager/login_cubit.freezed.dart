// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity userEntity) success,
    required TResult Function(String message) fail,
    required TResult Function() loading,
    required TResult Function() changeObsuerText,
    required TResult Function() cacheUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity userEntity)? success,
    TResult? Function(String message)? fail,
    TResult? Function()? loading,
    TResult? Function()? changeObsuerText,
    TResult? Function()? cacheUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity userEntity)? success,
    TResult Function(String message)? fail,
    TResult Function()? loading,
    TResult Function()? changeObsuerText,
    TResult Function()? cacheUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
    required TResult Function(Loading value) loading,
    required TResult Function(_ChangeObsuerText value) changeObsuerText,
    required TResult Function(_CacheUserData value) cacheUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
    TResult? Function(Loading value)? loading,
    TResult? Function(_ChangeObsuerText value)? changeObsuerText,
    TResult? Function(_CacheUserData value)? cacheUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    TResult Function(Loading value)? loading,
    TResult Function(_ChangeObsuerText value)? changeObsuerText,
    TResult Function(_CacheUserData value)? cacheUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity userEntity) success,
    required TResult Function(String message) fail,
    required TResult Function() loading,
    required TResult Function() changeObsuerText,
    required TResult Function() cacheUserData,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity userEntity)? success,
    TResult? Function(String message)? fail,
    TResult? Function()? loading,
    TResult? Function()? changeObsuerText,
    TResult? Function()? cacheUserData,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity userEntity)? success,
    TResult Function(String message)? fail,
    TResult Function()? loading,
    TResult Function()? changeObsuerText,
    TResult Function()? cacheUserData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
    required TResult Function(Loading value) loading,
    required TResult Function(_ChangeObsuerText value) changeObsuerText,
    required TResult Function(_CacheUserData value) cacheUserData,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
    TResult? Function(Loading value)? loading,
    TResult? Function(_ChangeObsuerText value)? changeObsuerText,
    TResult? Function(_CacheUserData value)? cacheUserData,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    TResult Function(Loading value)? loading,
    TResult Function(_ChangeObsuerText value)? changeObsuerText,
    TResult Function(_CacheUserData value)? cacheUserData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoginState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity userEntity});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userEntity = null,
  }) {
    return _then(_$SuccessImpl(
      userEntity: null == userEntity
          ? _value.userEntity
          : userEntity // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl({required this.userEntity});

  @override
  final UserEntity userEntity;

  @override
  String toString() {
    return 'LoginState.success(userEntity: $userEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.userEntity, userEntity) ||
                other.userEntity == userEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity userEntity) success,
    required TResult Function(String message) fail,
    required TResult Function() loading,
    required TResult Function() changeObsuerText,
    required TResult Function() cacheUserData,
  }) {
    return success(userEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity userEntity)? success,
    TResult? Function(String message)? fail,
    TResult? Function()? loading,
    TResult? Function()? changeObsuerText,
    TResult? Function()? cacheUserData,
  }) {
    return success?.call(userEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity userEntity)? success,
    TResult Function(String message)? fail,
    TResult Function()? loading,
    TResult Function()? changeObsuerText,
    TResult Function()? cacheUserData,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(userEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
    required TResult Function(Loading value) loading,
    required TResult Function(_ChangeObsuerText value) changeObsuerText,
    required TResult Function(_CacheUserData value) cacheUserData,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
    TResult? Function(Loading value)? loading,
    TResult? Function(_ChangeObsuerText value)? changeObsuerText,
    TResult? Function(_CacheUserData value)? cacheUserData,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    TResult Function(Loading value)? loading,
    TResult Function(_ChangeObsuerText value)? changeObsuerText,
    TResult Function(_CacheUserData value)? cacheUserData,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements LoginState {
  const factory Success({required final UserEntity userEntity}) = _$SuccessImpl;

  UserEntity get userEntity;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailImplCopyWith<$Res> {
  factory _$$FailImplCopyWith(
          _$FailImpl value, $Res Function(_$FailImpl) then) =
      __$$FailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$FailImpl>
    implements _$$FailImplCopyWith<$Res> {
  __$$FailImplCopyWithImpl(_$FailImpl _value, $Res Function(_$FailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailImpl implements Fail {
  const _$FailImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.fail(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailImplCopyWith<_$FailImpl> get copyWith =>
      __$$FailImplCopyWithImpl<_$FailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity userEntity) success,
    required TResult Function(String message) fail,
    required TResult Function() loading,
    required TResult Function() changeObsuerText,
    required TResult Function() cacheUserData,
  }) {
    return fail(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity userEntity)? success,
    TResult? Function(String message)? fail,
    TResult? Function()? loading,
    TResult? Function()? changeObsuerText,
    TResult? Function()? cacheUserData,
  }) {
    return fail?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity userEntity)? success,
    TResult Function(String message)? fail,
    TResult Function()? loading,
    TResult Function()? changeObsuerText,
    TResult Function()? cacheUserData,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
    required TResult Function(Loading value) loading,
    required TResult Function(_ChangeObsuerText value) changeObsuerText,
    required TResult Function(_CacheUserData value) cacheUserData,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
    TResult? Function(Loading value)? loading,
    TResult? Function(_ChangeObsuerText value)? changeObsuerText,
    TResult? Function(_CacheUserData value)? cacheUserData,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    TResult Function(Loading value)? loading,
    TResult Function(_ChangeObsuerText value)? changeObsuerText,
    TResult Function(_CacheUserData value)? cacheUserData,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class Fail implements LoginState {
  const factory Fail({required final String message}) = _$FailImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailImplCopyWith<_$FailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity userEntity) success,
    required TResult Function(String message) fail,
    required TResult Function() loading,
    required TResult Function() changeObsuerText,
    required TResult Function() cacheUserData,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity userEntity)? success,
    TResult? Function(String message)? fail,
    TResult? Function()? loading,
    TResult? Function()? changeObsuerText,
    TResult? Function()? cacheUserData,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity userEntity)? success,
    TResult Function(String message)? fail,
    TResult Function()? loading,
    TResult Function()? changeObsuerText,
    TResult Function()? cacheUserData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
    required TResult Function(Loading value) loading,
    required TResult Function(_ChangeObsuerText value) changeObsuerText,
    required TResult Function(_CacheUserData value) cacheUserData,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
    TResult? Function(Loading value)? loading,
    TResult? Function(_ChangeObsuerText value)? changeObsuerText,
    TResult? Function(_CacheUserData value)? cacheUserData,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    TResult Function(Loading value)? loading,
    TResult Function(_ChangeObsuerText value)? changeObsuerText,
    TResult Function(_CacheUserData value)? cacheUserData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements LoginState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ChangeObsuerTextImplCopyWith<$Res> {
  factory _$$ChangeObsuerTextImplCopyWith(_$ChangeObsuerTextImpl value,
          $Res Function(_$ChangeObsuerTextImpl) then) =
      __$$ChangeObsuerTextImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeObsuerTextImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$ChangeObsuerTextImpl>
    implements _$$ChangeObsuerTextImplCopyWith<$Res> {
  __$$ChangeObsuerTextImplCopyWithImpl(_$ChangeObsuerTextImpl _value,
      $Res Function(_$ChangeObsuerTextImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeObsuerTextImpl implements _ChangeObsuerText {
  const _$ChangeObsuerTextImpl();

  @override
  String toString() {
    return 'LoginState.changeObsuerText()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeObsuerTextImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity userEntity) success,
    required TResult Function(String message) fail,
    required TResult Function() loading,
    required TResult Function() changeObsuerText,
    required TResult Function() cacheUserData,
  }) {
    return changeObsuerText();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity userEntity)? success,
    TResult? Function(String message)? fail,
    TResult? Function()? loading,
    TResult? Function()? changeObsuerText,
    TResult? Function()? cacheUserData,
  }) {
    return changeObsuerText?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity userEntity)? success,
    TResult Function(String message)? fail,
    TResult Function()? loading,
    TResult Function()? changeObsuerText,
    TResult Function()? cacheUserData,
    required TResult orElse(),
  }) {
    if (changeObsuerText != null) {
      return changeObsuerText();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
    required TResult Function(Loading value) loading,
    required TResult Function(_ChangeObsuerText value) changeObsuerText,
    required TResult Function(_CacheUserData value) cacheUserData,
  }) {
    return changeObsuerText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
    TResult? Function(Loading value)? loading,
    TResult? Function(_ChangeObsuerText value)? changeObsuerText,
    TResult? Function(_CacheUserData value)? cacheUserData,
  }) {
    return changeObsuerText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    TResult Function(Loading value)? loading,
    TResult Function(_ChangeObsuerText value)? changeObsuerText,
    TResult Function(_CacheUserData value)? cacheUserData,
    required TResult orElse(),
  }) {
    if (changeObsuerText != null) {
      return changeObsuerText(this);
    }
    return orElse();
  }
}

abstract class _ChangeObsuerText implements LoginState {
  const factory _ChangeObsuerText() = _$ChangeObsuerTextImpl;
}

/// @nodoc
abstract class _$$CacheUserDataImplCopyWith<$Res> {
  factory _$$CacheUserDataImplCopyWith(
          _$CacheUserDataImpl value, $Res Function(_$CacheUserDataImpl) then) =
      __$$CacheUserDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CacheUserDataImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$CacheUserDataImpl>
    implements _$$CacheUserDataImplCopyWith<$Res> {
  __$$CacheUserDataImplCopyWithImpl(
      _$CacheUserDataImpl _value, $Res Function(_$CacheUserDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CacheUserDataImpl implements _CacheUserData {
  const _$CacheUserDataImpl();

  @override
  String toString() {
    return 'LoginState.cacheUserData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CacheUserDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(UserEntity userEntity) success,
    required TResult Function(String message) fail,
    required TResult Function() loading,
    required TResult Function() changeObsuerText,
    required TResult Function() cacheUserData,
  }) {
    return cacheUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(UserEntity userEntity)? success,
    TResult? Function(String message)? fail,
    TResult? Function()? loading,
    TResult? Function()? changeObsuerText,
    TResult? Function()? cacheUserData,
  }) {
    return cacheUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(UserEntity userEntity)? success,
    TResult Function(String message)? fail,
    TResult Function()? loading,
    TResult Function()? changeObsuerText,
    TResult Function()? cacheUserData,
    required TResult orElse(),
  }) {
    if (cacheUserData != null) {
      return cacheUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Fail value) fail,
    required TResult Function(Loading value) loading,
    required TResult Function(_ChangeObsuerText value) changeObsuerText,
    required TResult Function(_CacheUserData value) cacheUserData,
  }) {
    return cacheUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Success value)? success,
    TResult? Function(Fail value)? fail,
    TResult? Function(Loading value)? loading,
    TResult? Function(_ChangeObsuerText value)? changeObsuerText,
    TResult? Function(_CacheUserData value)? cacheUserData,
  }) {
    return cacheUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Fail value)? fail,
    TResult Function(Loading value)? loading,
    TResult Function(_ChangeObsuerText value)? changeObsuerText,
    TResult Function(_CacheUserData value)? cacheUserData,
    required TResult orElse(),
  }) {
    if (cacheUserData != null) {
      return cacheUserData(this);
    }
    return orElse();
  }
}

abstract class _CacheUserData implements LoginState {
  const factory _CacheUserData() = _$CacheUserDataImpl;
}
