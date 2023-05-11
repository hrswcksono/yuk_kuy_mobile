import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/product_provider.dart';

class HomeController extends GetxController with StateMixin<ProductModel> {
  List<bool> stateFilterHome = [];

  var productProvider = Get.put(ProductProvider());

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void changeState(int index) {
    stateFilterHome[index] = !stateFilterHome[index];
    update();
  }

  List<dynamic> toFilterList(input) {
    var temp = [];
    for (int i = 0; i < input.length; i++) {
      if (!temp.contains(input[i]["city"])) {
        temp.add(input[i]["city"]);
        stateFilterHome.add(false);
      }
    }
    return temp;
  }

  void getProduct() {
    try {
      productProvider.list_product().then((value) {
        print(value);
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        print('error');
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          // print(error);
        }
      }).whenComplete(() {
        log("List product complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }
}
