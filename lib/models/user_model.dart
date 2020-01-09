class User {
  String email;
  String password;
  String firstname;
  String lastname;
  String get fullname => '$lastname $firstname';

  User({this.email, this.password, this.firstname, this.lastname});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    password = json['password'] ?? '';
    firstname = json['firstname'] ?? '';
    lastname = json['lastname'] ?? '';
  }

  Map<String, dynamic> toJSON() {
    return {
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  @override
  String toString() {
    return 'User{email: $email, password: $password}, firstname: $firstname, lastname: $lastname}';
  }
}
