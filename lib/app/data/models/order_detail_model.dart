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
