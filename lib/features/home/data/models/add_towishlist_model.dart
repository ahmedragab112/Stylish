import 'package:json_annotation/json_annotation.dart';

part 'add_towishlist_model.g.dart';

@JsonSerializable()
class AddToWishListModel {
  final String? status;
 final String? message;
 final List<String>? data;

 const AddToWishListModel({this.status, this.message, this.data});

  factory AddToWishListModel.fromJson(Map<String, dynamic> json) =>
      _$AddToWishListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToWishListModelToJson(this);
}
