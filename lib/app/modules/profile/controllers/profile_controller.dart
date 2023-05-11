import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/data/models/profile_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/profile_provider.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';
import 'package:yuk_kuy_mobile/core/utils/helpers.dart';

import '../../../../services/storage_services.dart';

class ProfileController extends GetxController with StateMixin<ProfileModel> {
  var profileProvider = Get.put(ProfileProvider());
  var getService = Get.put(StorageService());

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void logout() {
    removeToken();
    Get.toNamed(AppPages.INITIAL_LR);
  }

  void initData() {
    try {
      profileProvider.detailProfile(readUsername()).then((value) {
        print(value);
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Profile complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }
}
