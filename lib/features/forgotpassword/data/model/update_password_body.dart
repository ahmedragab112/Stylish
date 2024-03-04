import 'package:json_annotation/json_annotation.dart';

part 'update_password_body.g.dart';
@JsonSerializable()
class UpdatePasswordBody {
  final String email;
  @JsonKey(name: 'newPassword')
  final String password;

  const UpdatePasswordBody({
    required this.email,
    required this.password,
  });

  factory UpdatePasswordBody.fromJson(Map<String, dynamic> json) => _$UpdatePasswordBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePasswordBodyToJson(this);
}
