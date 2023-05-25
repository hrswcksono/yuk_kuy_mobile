// To parse this JSON data, do
//
//     final profileSellerModel = profileSellerModelFromJson(jsonString);

import 'dart:convert';

ProfileSellerModel profileSellerModelFromJson(String str) =>
    ProfileSellerModel.fromJson(json.decode(str));

String profileSellerModelToJson(ProfileSellerModel data) =>
    json.encode(data.toJson());

class ProfileSellerModel {
  bool? status;
  ProfileSellerItem? data;

  ProfileSellerModel({
    this.status,
    this.data,
  });

  factory ProfileSellerModel.fromJson(Map<String, dynamic> json) =>
      ProfileSellerModel(
        status: json["status"],
        data: json["data"] == null
            ? null
            : ProfileSellerItem.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class ProfileSellerItem {
  int? id;
  String? username;
  String? name;
  String? email;
  String? password;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  Profile? profile;
  List<SocialAccount>? socialAccounts;
  List<Product>? products;

  ProfileSellerItem({
    this.id,
    this.username,
    this.name,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.profile,
    this.socialAccounts,
    this.products,
  });

  factory ProfileSellerItem.fromJson(Map<String, dynamic> json) =>
      ProfileSellerItem(
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
        socialAccounts: json["socialAccounts"] == null
            ? []
            : List<SocialAccount>.from(
                json["socialAccounts"]!.map((x) => SocialAccount.fromJson(x))),
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
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
        "socialAccounts": socialAccounts == null
            ? []
            : List<dynamic>.from(socialAccounts!.map((x) => x.toJson())),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
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

class SocialAccount {
  int? id;
  String? platform;
  String? link;
  int? accountId;
  DateTime? createdAt;
  DateTime? updatedAt;

  SocialAccount({
    this.id,
    this.platform,
    this.link,
    this.accountId,
    this.createdAt,
    this.updatedAt,
  });

  factory SocialAccount.fromJson(Map<String, dynamic> json) => SocialAccount(
        id: json["id"],
        platform: json["platform"],
        link: json["link"],
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
        "platform": platform,
        "link": link,
        "accountId": accountId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
