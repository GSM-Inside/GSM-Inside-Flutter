class LoginModel {
  final String username;
  final String password;

  LoginModel({
    required this.username,
    required this.password,
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
