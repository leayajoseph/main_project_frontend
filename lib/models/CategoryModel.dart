// To parse this JSON data, do
//
//     final viewCategory = viewCategoryFromJson(jsonString);

import 'dart:convert';

List<ViewCategory> viewCategoryFromJson(String str) => List<ViewCategory>.from(json.decode(str).map((x) => ViewCategory.fromJson(x)));

String viewCategoryToJson(List<ViewCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewCategory {
  String id;
  String categoryName;
  String categoryIcon;
  int v;

  ViewCategory({
    required this.id,
    required this.categoryName,
    required this.categoryIcon,
    required this.v,
  });

  factory ViewCategory.fromJson(Map<String, dynamic> json) => ViewCategory(
    id: json["_id"],
    categoryName: json["category_name"],
    categoryIcon: json["category_icon"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category_name": categoryName,
    "category_icon": categoryIcon,
    "__v": v,
  };
}
