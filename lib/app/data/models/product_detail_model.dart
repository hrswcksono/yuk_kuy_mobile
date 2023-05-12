// To parse this JSON data, do
//
//     final productDetailModel = productDetailModelFromJson(jsonString);

import 'dart:convert';

ProductDetailModel productDetailModelFromJson(String str) =>
    ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel data) =>
    json.encode(data.toJson());

class ProductDetailModel {
  bool? status;
  ProductDetailItem? data;

  ProductDetailModel({
    this.status,
    this.data,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        status: json["status"],
        data: json["data"] == null
            ? null
            : ProductDetailItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class ProductDetailItem {
  int? id;
  String? name;
  DateTime? dateStart;
  DateTime? dateEnd;
  int? price;
  String? province;
  String? city;
  String? addressDetail;
  dynamic longitude;
  dynamic latitude;
  String? description;
  String? addressMeetingPoint;
  int? isLive;
  int? accountId;
  int? guideId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ImageProduct>? imageProducts;
  Seller? seller;

  ProductDetailItem({
    this.id,
    this.name,
    this.dateStart,
    this.dateEnd,
    this.price,
    this.province,
    this.city,
    this.addressDetail,
    this.longitude,
    this.latitude,
    this.description,
    this.addressMeetingPoint,
    this.isLive,
    this.accountId,
    this.guideId,
    this.createdAt,
    this.updatedAt,
    this.imageProducts,
    this.seller,
  });

  factory ProductDetailItem.fromJson(Map<String, dynamic> json) =>
      ProductDetailItem(
        id: json["id"],
        name: json["name"],
        dateStart: json["dateStart"] == null
            ? null
            : DateTime.parse(json["dateStart"]),
        dateEnd:
            json["dateEnd"] == null ? null : DateTime.parse(json["dateEnd"]),
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        imageProducts: json["imageProducts"] == null
            ? []
            : List<ImageProduct>.from(
                json["imageProducts"]!.map((x) => ImageProduct.fromJson(x))),
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dateStart": dateStart?.toIso8601String(),
        "dateEnd": dateEnd?.toIso8601String(),
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "imageProducts": imageProducts == null
            ? []
            : List<dynamic>.from(imageProducts!.map((x) => x.toJson())),
        "seller": seller?.toJson(),
      };
}

class ImageProduct {
  int? id;
  String? src;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ImageProduct({
    this.id,
    this.src,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  factory ImageProduct.fromJson(Map<String, dynamic> json) => ImageProduct(
        id: json["id"],
        src: json["src"],
        productId: json["productId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "productId": productId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Seller {
  int? id;
  String? username;
  String? name;
  String? email;
  String? password;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;

  Seller({
    this.id,
    this.username,
    this.name,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
