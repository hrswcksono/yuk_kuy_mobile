import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';
import 'package:yuk_kuy_mobile/core/utils/helpers.dart';

import '../../../../services/storage_services.dart';
import '../../../data/models/favorite_model.dart';
import '../../../data/providers/product_provider.dart';

class DetailProductController extends GetxController
    with StateMixin<ProductDetailModel> {
  var productProvider = Get.put(ProductProvider());
  var getService = Get.put(StorageService());
  bool isFavorite = false;
  dynamic argumentData = Get.arguments;
  var listFavorite = List<FavoriteModel>.empty();

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool isLoading = true;

  @override
  void onInit() {
    initData(argumentData["id"]);
    super.onInit();
  }

  void initFavorite(data) {
    var temp = -1;
    var listFavorite = readFavorite();
    temp = listFavorite.indexWhere((element) => element[0] == data.id);
    if (temp != -1) {
      isFavorite = true;
    }
  }

  void changeFavorite(FavoriteModel data) {
    isFavorite = !isFavorite;
    if (isFavorite) {
      saveListFavorite(data);
    } else {
      deleteFavorite(data);
    }
    update();
  }

  void initData(int id) {
    try {
      productProvider.detailProduct(id).then((value) {
        // print(value);
        initFavorite(value.data);
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
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
      initData(argumentData["id"]);
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }
}
