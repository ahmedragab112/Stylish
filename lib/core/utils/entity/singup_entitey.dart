class UserEntity {
  UserDataEntity? user;
  String? token;

  UserEntity({this.user, this.token});
}

class UserDataEntity {
  String? name;
  String? email;

  UserDataEntity({
    this.name,
    this.email,
  });
}
