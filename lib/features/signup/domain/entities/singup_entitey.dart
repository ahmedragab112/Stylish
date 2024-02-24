class SignUpEntity {
  User? user;
  String? token;

  SignUpEntity({this.user, this.token});
}

class User {
  String? name;
  String? email;

  User({
    this.name,
    this.email,
  });
}
