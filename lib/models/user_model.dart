class User {
  String email;
  String password;

  User({this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    password = json['password'] ?? '';
  }

  Map<String, dynamic> toJSON() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{email: $email, password $password}';
  }
}
