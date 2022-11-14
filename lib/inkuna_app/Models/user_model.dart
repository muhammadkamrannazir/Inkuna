// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    this.image,
    this.interest,
    this.emailVerifiedAt,
    required this.isActive,
    this.accessToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String username;
  String firstName;
  String lastName;
  String phone;
  String email;
  String? image;
  String? interest;
  String? emailVerifiedAt;
  String isActive;
  String? accessToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        interest: json["interest"],
        emailVerifiedAt: json["email_verified_at"],
        isActive: json["is_active"],
        accessToken: json["accessToken"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "image": image,
        "interest": interest,
        "email_verified_at": emailVerifiedAt,
        "is_active": isActive,
        "accessToken": accessToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
