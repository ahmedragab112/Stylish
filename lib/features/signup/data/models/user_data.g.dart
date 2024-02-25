// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      name: json['name'] as String,
      rePassword: json['rePassword'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'phone': instance.phone,
    };
