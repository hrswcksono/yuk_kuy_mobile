import 'dart:io';

import 'package:get/get.dart';

import '../models/profile_model.dart';
import 'base_provider.dart';

class ProfileProvider extends BaseProvider {
  Future<ProfileModel> detailProfile(String username) async {
    var response = await get('accounts/$username');

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return profileModelFromJson(response.bodyString.toString());
    }
  }

  Future<bool> editProfile(String username, String name, String email,
      String phone, String address) async {
    Map<String, String> jsonBody = {
      'username': username,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };

    var response = await put(
      'accounts/edit/profile',
      jsonBody,
      contentType: "application/x-www-form-urlencoded",
    );

    return response.body['status'];
  }

  Future<bool> editPassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    Map<String, String> jsonBody = {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };

    var response = await put(
      'accounts/edit/password',
      jsonBody,
      contentType: "application/x-www-form-urlencoded",
    );

    return response.body['status'];
  }

  Future<dynamic> changeAvatar(File avatar) async {
    var avatarFile = MultipartFile(
      avatar,
      filename: "test.png",
      contentType: "multipart/form-data",
    );

    var body = FormData({
      'avatar': avatarFile,
    });

    var response = await put(
      'accounts/edit/avatar',
      body,
    );

    print(response.body.toString());

    return response.body.toString();
  }
}
