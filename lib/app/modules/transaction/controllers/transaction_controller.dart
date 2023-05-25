import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/core/values/strings.dart';

import '../../../data/models/order_model.dart';
import '../../../data/providers/order_provider.dart';

class TransactionController extends GetxController
    with StateMixin<List<OrderItem>>, ScrollMixin {
  List<bool> stateFilter = [true, false, false, false, false, false];
  var orderProvider = Get.put(OrderProvider());

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  RefreshController refreshController2 =
      RefreshController(initialRefresh: false);

  bool loadingPagination = false;

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

  void moveData() {
    orderItem.clear();
    stateIndex = 0;
    page = 1;
    lastPage = false;
    getFirstData = false;
    changeState(stateIndex);
    update();
  }

  void changeState(int index) {
    orderItem.clear();
    page = 1;
    lastPage = false;
    getFirstData = false;
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

  void changeData(OrderModel value) {
    // listFilter.addAll(value.data);
    if (!getFirstData && value.count == 0) {
      change(null, status: RxStatus.empty());
      // loadingPagination = false;
    } else if (getFirstData && value.count == 0) {
      lastPage = true;
      update();
    } else {
      getFirstData = true;
      orderItem.addAll(value.data!);
      change(orderItem, status: RxStatus.success());
      // loadingPagination = false;
    }
    loadingPagination = false;
    update();
  }

  void initData() {
    if (page > 1) {
      loadingPagination = true;
      update();
    } else {
      change(null, status: RxStatus.loading());
    }
    try {
      orderProvider.listOrder(page, 7).then((value) {
        changeData(value);
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
        loadingPagination = false;
        update();
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
    if (page > 1) {
      loadingPagination = true;
      update();
    } else {
      change(null, status: RxStatus.loading());
    }
    try {
      orderProvider.filterOrder(filter, page, 7).then((value) {
        changeData(value);
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
        loadingPagination = false;
        update();
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

  void dataUpdate() {
    orderItem.clear();
    page = 1;
    lastPage = false;
    getFirstData = false;
    dataChange(stateIndex);
    update();
  }

  void onRefresh() async {
    isLoading = false;
    update();
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000), () {
      dataUpdate();
      return refreshController.refreshCompleted();
    });
  }

  void onRefresh2() async {
    isLoading = false;
    update();
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000), () {
      dataUpdate();
      return refreshController2.refreshCompleted();
    });
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      // Get.dialog(Center(child: LinearProgressIndicator()));
      dataChange(stateIndex);
      // Get.back();
    }
  }

  @override
  Future<void> onTopScroll() async {}
}
