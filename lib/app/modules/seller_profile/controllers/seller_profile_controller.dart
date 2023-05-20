import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/models/profile_selller.dart';
import '../../../data/providers/profile_seller_provider.dart';

class SellerProfileController extends GetxController
    with StateMixin<ProfileSellerItem> {
  var selProv = Get.put(ProfileSellerProvider());

  dynamic args = Get.arguments;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    try {
      selProv.detailProfile(args["data"]).then((value) {
        change(value.data, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Profile complete!");
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
