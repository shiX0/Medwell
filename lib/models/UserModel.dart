// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String UserModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? email;
  String? id;
  String firstName;
  String lastName;
  String gender;
  String dob;

  UserModel({
    required this.email,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json["email"],
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    dob: json["dob"],
  );

  factory UserModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => UserModel(
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
