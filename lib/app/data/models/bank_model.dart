// To parse this JSON data, do
//
//     final bankModel = bankModelFromJson(jsonString);

import 'dart:convert';

BankModel bankModelFromJson(String str) => BankModel.fromJson(json.decode(str));

String bankModelToJson(BankModel data) => json.encode(data.toJson());

class BankModel {
  bool? status;
  int? count;
  List<BankItem>? data;

  BankModel({
    this.status,
    this.count,
    this.data,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        status: json["status"],
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<BankItem>.from(
                json["data"]!.map((x) => BankItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BankItem {
  int? id;
  String? bank;
  String? name;
  String? number;
  int? accountId;
  DateTime? createdAt;
  DateTime? updatedAt;

  BankItem({
    this.id,
    this.bank,
    this.name,
    this.number,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  factory BankItem.fromJson(Map<String, dynamic> json) => BankItem(
        id: json["id"],
        bank: json["bank"],
        name: json["name"],
        number: json["number"],
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
        "bank": bank,
        "name": name,
        "number": number,
        "accountId": accountId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
