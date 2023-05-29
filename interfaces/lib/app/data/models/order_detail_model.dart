// To parse this JSON data, do
//
//     final orderDetailModel = orderDetailModelFromJson(jsonString);

import 'dart:convert';

OrderDetailModel orderDetailModelFromJson(String str) =>
    OrderDetailModel.fromJson(json.decode(str));

String orderDetailModelToJson(OrderDetailModel data) =>
    json.encode(data.toJson());

class OrderDetailModel {
  bool? status;
  Data? data;

  OrderDetailModel({
    this.status,
    this.data,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  int? totalPackage;
  int? totalPrice;
  String? name;
  String? phone;
  String? email;
  int? productId;
  int? accountId;
  DateTime? createdAt;
  DateTime? updatedAt;
  StatusOrder? statusOrder;
  Product? product;
  Guide? guide;
  Seller? seller;

  Data({
    this.id,
    this.totalPackage,
    this.totalPrice,
    this.name,
    this.phone,
    this.email,
    this.productId,
    this.accountId,
    this.createdAt,
    this.updatedAt,
    this.statusOrder,
    this.product,
    this.guide,
    this.seller,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        totalPackage: json["totalPackage"],
        totalPrice: json["totalPrice"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        productId: json["productId"],
        accountId: json["accountId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        statusOrder: json["statusOrder"] == null
            ? null
            : StatusOrder.fromJson(json["statusOrder"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        guide: json["guide"] == null ? null : Guide.fromJson(json["guide"]),
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPackage": totalPackage,
        "totalPrice": totalPrice,
        "name": name,
        "phone": phone,
        "email": email,
        "productId": productId,
        "accountId": accountId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "statusOrder": statusOrder?.toJson(),
        "product": product?.toJson(),
        "guide": guide?.toJson(),
        "seller": seller?.toJson(),
      };
}

class StatusOrder {
  int? id;
  String? status;
  String? reason;
  String? orderId;
  DateTime? createdAt;
  DateTime? updatedAt;

  StatusOrder({
    this.id,
    this.status,
    this.reason,
    this.orderId,
    this.createdAt,
    this.updatedAt,
  });

  factory StatusOrder.fromJson(Map<String, dynamic> json) => StatusOrder(
        id: json["id"],
        status: json["status"],
        reason: json["reason"],
        orderId: json["orderId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "reason": reason,
        "orderId": orderId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Product {
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
  int? isDelete;
  int? accountId;
  int? guideId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Product({
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
    this.isDelete,
    this.accountId,
    this.guideId,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
        isDelete: json["isDelete"],
        accountId: json["accountId"],
        guideId: json["guideId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        "isDelete": isDelete,
        "accountId": accountId,
        "guideId": guideId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Guide {
  int? id;
  String? name;
  String? phone;
  int? accountId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Guide({
    this.id,
    this.name,
    this.phone,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  factory Guide.fromJson(Map<String, dynamic> json) => Guide(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        accountId: json["accountId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "accountId": accountId,
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
