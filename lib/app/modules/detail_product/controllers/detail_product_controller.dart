import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';

import '../../../data/providers/product_provider.dart';

class DetailProductController extends GetxController
    with StateMixin<ProductDetailModel> {
  var productProvider = Get.put(ProductProvider());
  bool isFavorite = false;
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    initData(argumentData["id"]);
    super.onInit();
  }

  void changeFavorite() {
    isFavorite = !isFavorite;
    update();
  }

  void initData(int id) {
    try {
      productProvider.detail_product(id).then((value) {
        print(value);
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        print('error');
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
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
