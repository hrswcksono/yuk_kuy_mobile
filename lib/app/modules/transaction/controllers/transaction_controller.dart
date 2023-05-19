import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/core/values/strings.dart';

import '../../../data/models/order_model.dart';
import '../../../data/providers/order_provider.dart';
import 'package:collection/collection.dart';

class TransactionController extends GetxController
    with StateMixin<List<OrderItem>>, ScrollMixin {
  List<bool> stateFilter = [true, false, false, false, false, false];
  var orderProvider = Get.put(OrderProvider());

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;
  int stateIndex = 0;

  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  var orderItem = List<OrderItem>.empty(growable: true);

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void changeState(int index) {
    orderItem.clear();
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
      page = 0;
      filterOrder(Strings.queryTransaction[index]);
    } else {
      initData();
    }
  }

  void changeData(OrderModel value) {
    // listFilter.addAll(value.data);
    if (!getFirstData && value.count == 0) {
      change(null, status: RxStatus.empty());
    } else if (getFirstData && value.count == 0) {
      lastPage = true;
      update();
    } else {
      getFirstData = true;
      orderItem.addAll(value.data!);
      change(orderItem, status: RxStatus.success());
    }
  }

  void initData() {
    try {
      orderProvider.listOrder(page, 7).then((value) {
        changeData(value);
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
    try {
      orderProvider.filterOrder(filter, page, 7).then((value) {
        changeData(value);
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
      page = 0;
      orderItem.clear();
      dataChange(stateIndex);
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }

  @override
  Future<void> onEndScroll() async {
    print('onEndScroll');
    if (!lastPage) {
      page += 1;
      Get.dialog(Center(child: LinearProgressIndicator()));
      dataChange(stateIndex);
      Get.back();
    } else {
      Get.snackbar('Alert', 'End of Product');
    }
  }

  @override
  Future<void> onTopScroll() async {
    if (page != 0) {
      page -= 1;
      Get.dialog(Center(child: LinearProgressIndicator()));
      dataChange(stateIndex);
      Get.back();
    } else {
      Get.snackbar('Alert', 'Top of Product');
    }
    print('onTopScroll');
  }
}
