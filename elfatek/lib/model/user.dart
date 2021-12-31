// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.token,
  });

  int? id;
  String? name;
  String? email;
  String? password;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
      );
  factory User.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      name: json['user']['name'],
      token: json['token'] ?? '',
    );
  }
  factory User.fromReqBodyToken(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    return User(
      // id: json['user']['id'],
      // email: json['user']['email'],
      // name: json['user']['name'],
      token: json['token'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "token": token,
      };
}
