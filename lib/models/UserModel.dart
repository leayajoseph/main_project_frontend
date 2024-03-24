// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

List<UserDetails> userDetailsFromJson(String str) => List<UserDetails>.from(json.decode(str).map((x) => UserDetails.fromJson(x)));

String userDetailsToJson(List<UserDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetails {
  String id;
  String email;
  String password;
  String name;
  String phone;
  String address;
  String pincode;
  int v;

  UserDetails({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.address,
    required this.pincode,
    required this.v,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    id: json["_id"],
    email: json["email"],
    password: json["password"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    pincode: json["pincode"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "password": password,
    "name": name,
    "phone": phone,
    "address": address,
    "pincode": pincode,
    "__v": v,
  };
}
