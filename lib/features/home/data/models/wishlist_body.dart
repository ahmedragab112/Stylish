import 'package:json_annotation/json_annotation.dart';

part 'wishlist_body.g.dart';
@JsonSerializable()
class WishListBody {
  String productId;

  WishListBody({required this.productId});

  factory WishListBody.fromJson(Map<String, dynamic> json) => _$WishListBodyFromJson(json);
  Map<String, dynamic> toJson() => _$WishListBodyToJson(this);

}
