

import 'package:json_annotation/json_annotation.dart';


part 'add_product_to_cart.g.dart';
@JsonSerializable()
class AddProductToCartModel {
  String? status;
  String? message;
  int? numOfCartItems;
  Data? data;

  AddProductToCartModel(
      {this.status, this.message, this.numOfCartItems, this.data});

  factory AddProductToCartModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductToCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductToCartModelToJson(this);
}
@JsonSerializable()
class Data {
  String? sId;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  Data(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
 
}
@JsonSerializable()
class Products {
  int? count;
  String? sId;
  String? product;
  int? price;


  Products({this.count, this.sId, this.product, this.price});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
 
}
