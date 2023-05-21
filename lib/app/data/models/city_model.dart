// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  bool? status;
  int? count;
  List<CityItem>? data;

  CityModel({
    this.status,
    this.count,
    this.data,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        status: json["status"],
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<CityItem>.from(
                json["data"]!.map((x) => CityItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "count": count,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CityItem {
  String? city;

  CityItem({
    this.city,
  });

  factory CityItem.fromJson(Map<String, dynamic> json) => CityItem(
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
      };
}
