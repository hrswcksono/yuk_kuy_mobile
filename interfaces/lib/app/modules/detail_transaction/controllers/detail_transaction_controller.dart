import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/data/models/order_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/order_provider.dart';

class DetailTransactionController extends GetxController
    with StateMixin<OrderDetailModel> {
  var orderProv = Get.put(OrderProvider());

  dynamic args = Get.arguments;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    try {
      orderProv.detailOrder(args["orderId"]).then((value) {
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Detail Order complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }
}
