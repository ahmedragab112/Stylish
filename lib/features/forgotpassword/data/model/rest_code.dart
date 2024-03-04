import 'package:json_annotation/json_annotation.dart';

part 'rest_code.g.dart';
@JsonSerializable()
class RestCodeModel {
  @JsonKey(name: "resetCode")
  final String restCode;

  const RestCodeModel({required this.restCode});

  factory RestCodeModel.fromJson(Map<String, dynamic> json) =>
      _$RestCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestCodeModelToJson(this);
}
