
import 'package:json_annotation/json_annotation.dart';
 
part 'verification_code.g.dart';
@JsonSerializable()
class VerificationCodeModel {
 
  final String status;
  const VerificationCodeModel({
    
    required this.status,
  });

  factory VerificationCodeModel.fromJson(Map<String, dynamic> json) => _$VerificationCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationCodeModelToJson(this);
}