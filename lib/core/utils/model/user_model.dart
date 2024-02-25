import 'package:stylehub/core/utils/entity/singup_entitey.dart';

class UserModel extends UserEntity {
  String? message;

  UserModel({this.message, super.user, super.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class User extends UserDataEntity {
  String? role;

  User({super.name, super.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
}
