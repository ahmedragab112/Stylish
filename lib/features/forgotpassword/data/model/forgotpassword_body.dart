

import 'package:json_annotation/json_annotation.dart';

part 'forgotpassword_body.g.dart';
@JsonSerializable()
class ForgotPasswordBody {
  final String email;
  const ForgotPasswordBody({required this.email});

  factory ForgotPasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordBodyToJson(this);
}