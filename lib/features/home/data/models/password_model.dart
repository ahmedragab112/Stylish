class PasswordModel {
  String? currentPassword;
  String? password;
  String? rePassword;

  PasswordModel({this.currentPassword, this.password, this.rePassword});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    currentPassword = json['currentPassword'];
    password = json['password'];
    rePassword = json['rePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPassword'] = currentPassword;
    data['password'] = password;
    data['rePassword'] = rePassword;
    return data;
  }
}
