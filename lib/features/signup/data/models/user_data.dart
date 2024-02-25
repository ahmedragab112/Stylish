import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String name;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  UserData(
      {required this.name,
      required this.rePassword,
      required this.phone,
      required this.email,
      required this.password});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
