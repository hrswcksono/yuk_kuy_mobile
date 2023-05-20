import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/product_provider.dart';
import 'package:collection/collection.dart';

import '../../../data/models/city_model.dart';

class HomeController extends GetxController
    with StateMixin<List<ProductItem>>, ScrollMixin {
  List<bool> stateFilterHome = [];

  var productProvider = Get.put(ProductProvider());

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ScrollController scrollController = ScrollController();

  void test() {
    scrollController.addListener(() {
      print("position : ${scrollController.offset}");
    });
  }

  bool isLoading = true;

  String keyword = "";

  var listFilter = List<CityItem>.empty(growable: true);

  late TextEditingController search;

  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  var productItem = List<ProductItem>.empty(growable: true);

  int stateData = 1;

  @override
  void onInit() {
    search = TextEditingController();
    getListCity();
    getProductPagination();
    super.onInit();
  }

  void moveData() {
    search.clear();
    listFilter.clear();
    productItem.clear();
    stateData = 1;
    page = 1;
    lastPage = false;
    getListCity();
    getProductPagination();
  }

  void changeState(int index, String filterKey) {
    bool temp = stateFilterHome[index];
    if (temp) {
      stateData = 1;
      resetList();
      getProductPagination();
    } else {
      stateData = 2;
      resetList();
      keyword = filterKey;
      getFilterProduct(filterKey);
    }
    stateFilterHome.forEachIndexed((idx, _) {
      stateFilterHome[idx] = false;
    });
    stateFilterHome[index] = !temp;
    update();
  }

  List<dynamic> toFilterList() {
    var temp = [];
    for (int i = 0; i < listFilter.length; i++) {
      temp.add(listFilter[i].city);
      stateFilterHome.add(false);
    }
    return temp;
  }

  void initData() {
    getProductPagination();
    listFilter.clear();
  }

  void resetList() {
    productItem.clear();
    page = 1;
    getFirstData = false;
    lastPage = false;
  }

  void changeData(ProductModel value) {
    if (!getFirstData && value.count == 0) {
      change(null, status: RxStatus.empty());
    } else if (getFirstData && value.count == 0) {
      lastPage = true;
      update();
    } else {
      getFirstData = true;
      productItem.addAll(value.data);
      change(productItem, status: RxStatus.success());
    }
  }

  void getListCity() {
    try {
      productProvider.listCity().then((value) {
        print(value.toString());
        listFilter.addAll(value.data!);
      }).onError((error, stackTrace) {
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
      productProvider.listProductPagination(page, 6).then((value) {
        changeData(value);
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
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
      productProvider.filterProduct(key, page, 6).then((value) {
        changeData(value);
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
      }).whenComplete(() {
        log("List product complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void searchProduct() {
    try {
      change(null, status: RxStatus.loading());
      productProvider.searchProduct(search.text, page, 6).then((value) {
        changeData(value);
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
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
      stateData = 1;
      page = 1;
      listFilter.clear();
      productItem.clear();
      lastPage = false;
      getProductPagination();
      getListCity();
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      Get.dialog(Center(child: LinearProgressIndicator()));
      if (stateData == 1) {
        print('onEndScrollAll');
        getProductPagination();
      } else if (stateData == 2) {
        print('onEndScrollFilter');
        getFilterProduct(keyword);
      } else if (stateData == 3) {
        print('onEndScrollSearch');
        searchProduct();
      }
      Get.back();
    } else {
      Get.snackbar('Alert', 'End of Product');
    }
  }

  @override
  Future<void> onTopScroll() async {
    print('onTopScroll');
  }
}
