// To parse this JSON data, do
//
//     final viewProduct = viewProductFromJson(jsonString);

import 'dart:convert';

List<ViewProduct> viewProductFromJson(String str) => List<ViewProduct>.from(json.decode(str).map((x) => ViewProduct.fromJson(x)));

String viewProductToJson(List<ViewProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewProduct {
  String id;
  String productName;
  String price;
  String discount;
  String discountPrice;
  ShortDesc shortDesc;
  String longDesc;
  String vendorId;
  String categoryId;
  String videoLink;
  String productImg;
  int v;

  ViewProduct({
    required this.id,
    required this.productName,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.shortDesc,
    required this.longDesc,
    required this.vendorId,
    required this.categoryId,
    required this.videoLink,
    required this.productImg,
    required this.v,
  });

  factory ViewProduct.fromJson(Map<String, dynamic> json) => ViewProduct(
    id: json["_id"],
    productName: json["product_name"],
    price: json["price"],
    discount: json["discount"],
    discountPrice: json["discount_price"],
    shortDesc: shortDescValues.map[json["short_desc"]]!,
    longDesc: json["long_desc"],
    vendorId: json["vendor_id"],
    categoryId: json["category_id"],
    videoLink: json["video_link"],
    productImg: json["product_img"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "product_name": productName,
    "price": price,
    "discount": discount,
    "discount_price": discountPrice,
    "short_desc": shortDescValues.reverse[shortDesc],
    "long_desc": longDesc,
    "vendor_id": vendorId,
    "category_id": categoryId,
    "video_link": videoLink,
    "product_img": productImg,
    "__v": v,
  };
}

enum ShortDesc {
  NO_ADDED_PRESERVATIVES_NO_COLOR_ADDED
}

final shortDescValues = EnumValues({
  "no added preservatives, no color added": ShortDesc.NO_ADDED_PRESERVATIVES_NO_COLOR_ADDED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
