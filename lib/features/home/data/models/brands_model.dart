
import 'package:json_annotation/json_annotation.dart';
 
part 'brands_model.g.dart';
@JsonSerializable()
class BrandsModel {
  int? results;
  Metadata? metadata;
  List<Data>? data;

  BrandsModel({this.results, this.metadata, this.data});

  factory BrandsModel.fromJson(Map<String, dynamic> json) =>
      _$BrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandsModelToJson(this);
}
@JsonSerializable()
class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
@JsonSerializable()
class Data {
  @JsonKey(name: '_id')
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
