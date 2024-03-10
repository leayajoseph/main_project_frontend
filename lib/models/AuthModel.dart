// To parse this JSON data, do
//
//     final userAuth = userAuthFromJson(jsonString);

import 'dart:convert';

List<UserAuth> userAuthFromJson(String str) => List<UserAuth>.from(json.decode(str).map((x) => UserAuth.fromJson(x)));

String userAuthToJson(List<UserAuth> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAuth {
  String email;
  String password;
  String name;
  String phone;
  String address;
  String pincode;

  UserAuth({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.pincode,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) => UserAuth(
    email: json["email"],
    password: json["password"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name": name,
    "phone": phone,
    "address": address,
    "pincode": pincode,
  };
}
