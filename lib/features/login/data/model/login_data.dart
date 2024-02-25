import 'package:json_annotation/json_annotation.dart';
part 'login_data.g.dart';
@JsonSerializable()
class LoginData {
  String email;
  String password;

  LoginData({required this.email,required this.password});

  factory LoginData.fromJson(Map<String, dynamic> json) =>_$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
