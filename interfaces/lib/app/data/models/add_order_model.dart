// To parse this JSON data, do
//
//     final addOrderModel = addOrderModelFromJson(jsonString);

import 'dart:convert';

AddOrderModel addOrderModelFromJson(String str) =>
    AddOrderModel.fromJson(json.decode(str));

String addOrderModelToJson(AddOrderModel data) => json.encode(data.toJson());

class AddOrderModel {
  bool? status;
  String? message;
  Data? data;

  AddOrderModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
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
  DateTime? updatedAt;
  DateTime? createdAt;
  int? sellerId;
  String? redirectUrl;

  Data({
    this.id,
    this.totalPackage,
    this.totalPrice,
    this.name,
    this.phone,
    this.email,
    this.productId,
    this.accountId,
    this.updatedAt,
    this.createdAt,
    this.sellerId,
    this.redirectUrl,
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
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        sellerId: json["sellerId"],
        redirectUrl: json["redirectUrl"],
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
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "sellerId": sellerId,
        "redirectUrl": redirectUrl,
      };
}
