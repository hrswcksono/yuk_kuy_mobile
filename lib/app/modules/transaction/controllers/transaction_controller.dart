import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/core/values/consts.dart';
import 'package:yuk_kuy_mobile/core/values/strings.dart';

import '../../../data/models/order_model.dart';
import '../../../data/providers/order_provider.dart';
import 'package:collection/collection.dart';

import '../../../data/providers/verification_provider.dart';

class TransactionController extends GetxController with StateMixin<OrderModel> {
  List<bool> stateFilter = [true, false, false, false, false, false];
  var orderProvider = Get.put(OrderProvider());

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;
  int stateIndex = 0;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void changeState(int index) {
    bool temp = stateFilter[index];
    stateIndex = index;
    stateFilter.forEachIndexed((idx, _) {
      stateFilter[idx] = false;
    });
    stateFilter[index] = !temp;
    if (!stateFilter.contains(true)) {
      stateFilter[0] = true;
      initData();
    } else {
      dataChange(index);
    }
    update();
  }

  void dataChange(int index) {
    if (index != 0) {
      filterOrder(Strings.queryTransaction[index]);
    } else {
      initData();
    }
  }

  void initData() {
    change(null, status: RxStatus.loading());
    try {
      orderProvider.listOrder().then((value) {
        print("list order");
        print(value);
        if (value.data!.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          print("empty");
          change(value, status: RxStatus.empty());
        }
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

  void filterOrder(String filter) {
    change(null, status: RxStatus.loading());
    try {
      orderProvider.filterOrder(filter).then((value) {
        print("list order");
        print(value);
        if (value.data!.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          print("empty");
          change(value, status: RxStatus.empty());
        }
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
      dataChange(stateIndex);
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }
}
