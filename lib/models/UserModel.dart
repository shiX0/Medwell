// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? email;
  String? id;
  String firstName;
  String lastName;
  String gender;
  String dob;

  User({
    required this.email,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    dob: json["dob"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "dob": dob,
  };
}
