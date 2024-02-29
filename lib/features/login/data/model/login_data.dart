import 'package:json_annotation/json_annotation.dart';
part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  final String email;
  final String password;

  const LoginData({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
