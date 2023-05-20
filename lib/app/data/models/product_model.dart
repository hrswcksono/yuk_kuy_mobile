// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  bool status;
  int count;
  List<ProductItem> data;

  ProductModel({
    required this.status,
    required this.count,
    required this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        status: json["status"],
        count: json["count"],
        data: List<ProductItem>.from(
            json["data"].map((x) => ProductItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductItem {
  int id;
  String name;
  DateTime dateStart;
  DateTime dateEnd;
  int price;
  String province;
  String city;
  String addressDetail;
  dynamic longitude;
  dynamic latitude;
  String description;
  String addressMeetingPoint;
  int isLive;
  int accountId;
  int guideId;
  DateTime createdAt;
  DateTime updatedAt;
  List<ImageProduct> imageProducts;

  ProductItem({
    required this.id,
    required this.name,
    required this.dateStart,
    required this.dateEnd,
    required this.price,
    required this.province,
    required this.city,
    required this.addressDetail,
    this.longitude,
    this.latitude,
    required this.description,
    required this.addressMeetingPoint,
    required this.isLive,
    required this.accountId,
    required this.guideId,
    required this.createdAt,
    required this.updatedAt,
    required this.imageProducts,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["id"],
        name: json["name"],
        dateStart: DateTime.parse(json["dateStart"]),
        dateEnd: DateTime.parse(json["dateEnd"]),
        price: json["price"],
        province: json["province"],
        city: json["city"],
        addressDetail: json["addressDetail"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        description: json["description"],
        addressMeetingPoint: json["addressMeetingPoint"],
        isLive: json["isLive"],
        accountId: json["accountId"],
        guideId: json["guideId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        imageProducts: List<ImageProduct>.from(
            json["imageProducts"].map((x) => ImageProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dateStart": dateStart.toIso8601String(),
        "dateEnd": dateEnd.toIso8601String(),
        "price": price,
        "province": province,
        "city": city,
        "addressDetail": addressDetail,
        "longitude": longitude,
        "latitude": latitude,
        "description": description,
        "addressMeetingPoint": addressMeetingPoint,
        "isLive": isLive,
        "accountId": accountId,
        "guideId": guideId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "imageProducts":
            List<dynamic>.from(imageProducts.map((x) => x.toJson())),
      };
}

class ImageProduct {
  int id;
  String src;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;

  ImageProduct({
    required this.id,
    required this.src,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImageProduct.fromJson(Map<String, dynamic> json) => ImageProduct(
        id: json["id"],
        src: json["src"],
        productId: json["productId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "productId": productId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
