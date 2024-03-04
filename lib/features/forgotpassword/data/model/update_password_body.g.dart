// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordBody _$UpdatePasswordBodyFromJson(Map<String, dynamic> json) =>
    UpdatePasswordBody(
      email: json['email'] as String,
      password: json['newPassword'] as String,
    );

Map<String, dynamic> _$UpdatePasswordBodyToJson(UpdatePasswordBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.password,
    };
