import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/product_provider.dart';
import 'package:collection/collection.dart';

class HomeController extends GetxController with StateMixin<ProductModel> {
  List<bool> stateFilterHome = [];

  var productProvider = Get.put(ProductProvider());

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;

  int page = 1;
  String keyword = "";

  var listFilter = List<ProductItem>.empty(growable: true);

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  void changeState(int index, String filterKey) {
    bool temp = stateFilterHome[index];
    if (temp) {
      getProduct();
    } else {
      getFilterProduct(filterKey);
    }
    stateFilterHome.forEachIndexed((idx, _) {
      stateFilterHome[idx] = false;
    });
    stateFilterHome[index] = !temp;
    update();
  }

  void initData() {
    getProduct();
    listFilter.clear();
  }

  List<dynamic> toFilterList() {
    var temp = [];
    for (int i = 0; i < listFilter.length; i++) {
      if (!temp.contains(listFilter[i].city)) {
        temp.add(listFilter[i].city);
        stateFilterHome.add(false);
      }
    }
    return temp;
  }

  void getProduct() {
    try {
      change(null, status: RxStatus.loading());
      productProvider.listProduct().then((value) {
        print(value);
        listFilter.clear();
        listFilter.addAll(value.data);
        // if (listFilter.isEmpty) {
        //   // stateFilterHome.forEachIndexed((index, _) {
        //   //   stateFilterHome[index] = false;
        //   // });
        // }
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

  void getProductPagination() {
    try {
      productProvider.listProductPagination(page).then((value) {
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

  void getFilterProduct(String key) {
    try {
      change(null, status: RxStatus.loading());
      productProvider.filterProduct(key).then((value) {
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
      getProduct();
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }
}
