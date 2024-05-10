import 'package:hive/hive.dart';

part 'user_data_model.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  UserData({this.name, this.email});
}
