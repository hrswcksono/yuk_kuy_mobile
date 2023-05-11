import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/values/keys/get_storage_key.dart';
import '../../../../services/storage_services.dart';
import '../../../data/providers/login_provider.dart';
import '../../../routes/app_pages.dart';

class LoginRegisterController extends GetxController {
  var loginProvider = Get.put(LoginProvider());
  var getService = Get.put(StorageService());

  late TextEditingController emailLoginTF;
  late TextEditingController passwordLoginTF;

  // final count = 0.obs;
  @override
  void onInit() {
    initTextLogin();
    super.onInit();
  }

  void initTextLogin() {
    emailLoginTF = TextEditingController();
    passwordLoginTF = TextEditingController();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void login() {
    try {
      loginProvider
          .provider(emailLoginTF.text, passwordLoginTF.text.toString())
          .then((value) {
        getService.write(GetStorageKey.userToken, value.data.accessToken);
        getService.write(GetStorageKey.userName, value.data.username);
        Future.delayed(const Duration(seconds: 2), () {
          Get.back();
          Get.toNamed(AppPages.INITIAL_B);
          // print(readUserData()['id_user']);
          // print(readToken());
          // print("Timeout");
        });
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error);
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }
}
