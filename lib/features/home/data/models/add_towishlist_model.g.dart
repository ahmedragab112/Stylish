// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_towishlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToWishListModel _$AddToWishListModelFromJson(Map<String, dynamic> json) =>
    AddToWishListModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddToWishListModelToJson(AddToWishListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
