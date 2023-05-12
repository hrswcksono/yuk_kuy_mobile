import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';
import 'package:yuk_kuy_mobile/core/utils/helpers.dart';

import '../../../../core/values/keys/get_storage_key.dart';
import '../../../../services/storage_services.dart';
import '../../../data/providers/product_provider.dart';

class DetailProductController extends GetxController
    with StateMixin<ProductDetailModel> {
  var productProvider = Get.put(ProductProvider());
  var getService = Get.put(StorageService());
  bool isFavorite = false;
  dynamic argumentData = Get.arguments;
  var listFavorite = List<ProductDetailItem>.empty();

  @override
  void onInit() {
    // removefavorite();
    initFavorite();
    initData(argumentData["id"]);
    super.onInit();
  }

  void initFavorite() {
    listFavorite = readListFavorite();
    print("init fav");
    if (listFavorite.length != 0) {
      print(listFavorite.firstWhere((element) => element.id == 9));
    }
  }

  void changeFavorite(ProductDetailItem data) {
    isFavorite = !isFavorite;
    listFavorite = readListFavorite();
    listFavorite.add(data);
    getService.write(GetStorageKey.listFavorite, listFavorite);
    print((listFavorite[0].toJson()));
    update();
  }

  void initData(int id) {
    try {
      productProvider.detail_product(id).then((value) {
        // print(value);
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
