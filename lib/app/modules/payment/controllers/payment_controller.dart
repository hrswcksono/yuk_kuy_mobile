import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/data/providers/order_provider.dart';

class PaymentController extends GetxController {
  dynamic argumentData = Get.arguments;
  String title = "";
  int price = 0, numPeople = 1;
  int totalPrice = 0;
  var orderProvider = Get.put(OrderProvider());

  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;

  bool showListBank = false;
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
        log("Order Conplete complete!");
      });
    } catch (e) {}
  }
}
