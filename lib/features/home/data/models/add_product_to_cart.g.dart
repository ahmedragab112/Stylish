// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_to_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductToCartModel _$AddProductToCartModelFromJson(
        Map<String, dynamic> json) =>
    AddProductToCartModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductToCartModelToJson(
        AddProductToCartModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      sId: json['sId'] as String?,
      cartOwner: json['cartOwner'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
      totalCartPrice: json['totalCartPrice'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'sId': instance.sId,
      'cartOwner': instance.cartOwner,
      'products': instance.products,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'totalCartPrice': instance.totalCartPrice,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      count: json['count'] as int?,
      sId: json['sId'] as String?,
      product: json['product'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'count': instance.count,
      'sId': instance.sId,
      'product': instance.product,
      'price': instance.price,
    };
