import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/models/order_model.dart';
import '../../../data/providers/order_provider.dart';

class TransactionController extends GetxController with StateMixin<OrderModel> {
  List<bool> stateFilter = [true, false, false, false, false, false];
  var orderProvider = Get.put(OrderProvider());

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void changeState(int index) {
    stateFilter[index] = !stateFilter[index];
    update();
  }

  void initData() {
    try {
      orderProvider.listOrder().then((value) {
        print("list order");
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

  void onRefresh() async {
    isLoading = false;
    update();
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000), () {
      initData();
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }
}
