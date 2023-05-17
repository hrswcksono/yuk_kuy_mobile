// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  bool? status;
  int? page;
  int? count;
  List<Datum>? data;

  OrderModel({
    this.status,
    this.page,
    this.count,
    this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        page: json["page"],
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "page": page,
        "count": count,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
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

  Datum({
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  List<ImageProduct>? imageProducts;

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
    this.imageProducts,
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
        imageProducts: json["imageProducts"] == null
            ? []
            : List<ImageProduct>.from(
                json["imageProducts"]!.map((x) => ImageProduct.fromJson(x))),
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
        "imageProducts": imageProducts == null
            ? []
            : List<dynamic>.from(imageProducts!.map((x) => x.toJson())),
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

class StatusOrder {
  int? id;
  String? status;
  dynamic reason;
  int? orderId;
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
