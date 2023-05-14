import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/order_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/order_provider.dart';

class PaymentController extends GetxController
    with StateMixin<OrderDetailModel> {
  dynamic argumentData = Get.arguments;
  String title = "";
  int price = 0, numPeople = 1;
  int totalPrice = 0;
  var orderProvider = Get.put(OrderProvider());

  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;

  int idOrder = 0;

  bool showListBank = false;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;

  final ImagePicker _picker = ImagePicker();
  File? imageProduct;

  @override
  void onInit() {
    super.onInit();
  }

  void initData() {
    name = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    title = argumentData["data"].name;
    price = argumentData["data"].price;
    totalPrice = price;
  }

  void addPeople() {
    numPeople++;
    totalPrice = totalPrice + price;
    update();
  }

  void reducePeople() {
    if (numPeople > 1) {
      numPeople--;
      totalPrice = totalPrice - price;
      update();
    }
  }

  void stateListBank() {
    showListBank = !showListBank;
    update();
  }

  addImage(String label) async {
    if (label == "Gallery") {
      var pickImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        imageProduct = File(pickImage.path);
      }
      update();
    } else if (label == "Camera") {
      var pickImage = await _picker.pickImage(source: ImageSource.camera);
      if (pickImage != null) {
        imageProduct = File(pickImage.path);
      }
      update();
    }
  }

  void addOrder() {
    try {
      orderProvider
          .addOder(name.text, phone.text, email.text, totalPrice, numPeople,
              argumentData["data"].id)
          .then((value) {
        print("berhasil");
        print(value);
      }).onError((error, stackTrace) {
        print('error');
        // change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Add Order complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void detailOrder(int id) {
    idOrder = id;
    try {
      orderProvider.detailOrder(id).then((value) {
        change(value, status: RxStatus.success());
        print("berhasil");
        print(value);
      }).onError((error, stackTrace) {
        print('error');
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

  void onRefresh() async {
    isLoading = false;
    update();
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000), () {
      detailOrder(idOrder);
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }
}
