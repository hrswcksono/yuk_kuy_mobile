// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool? status;
  ProfileItem? data;

  ProfileModel({
    this.status,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        data: json["data"] == null ? null : ProfileItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class ProfileItem {
  int? id;
  String? username;
  String? name;
  String? email;
  String? password;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  Profile? profile;

  ProfileItem({
    this.id,
    this.username,
    this.name,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.profile,
  });

  factory ProfileItem.fromJson(Map<String, dynamic> json) => ProfileItem(
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
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
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
        "profile": profile?.toJson(),
      };
}

class Profile {
  int? id;
  dynamic address;
  dynamic phone;
  String? avatar;
  String? bannerImage;
  int? accountId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Profile({
    this.id,
    this.address,
    this.phone,
    this.avatar,
    this.bannerImage,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        address: json["address"],
        phone: json["phone"],
        avatar: json["avatar"],
        bannerImage: json["bannerImage"],
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
        "address": address,
        "phone": phone,
        "avatar": avatar,
        "bannerImage": bannerImage,
        "accountId": accountId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
