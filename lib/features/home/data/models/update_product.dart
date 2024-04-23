
import 'package:json_annotation/json_annotation.dart';


part 'update_product.g.dart';
@JsonSerializable()
class UpdateProductBody {
  String count;

  UpdateProductBody({required this.count});



  Map<String, dynamic> toJson() => _$UpdateProductBodyToJson(this); 

  factory UpdateProductBody.fromJson(Map<String, dynamic> json) => _$UpdateProductBodyFromJson(json);
}
