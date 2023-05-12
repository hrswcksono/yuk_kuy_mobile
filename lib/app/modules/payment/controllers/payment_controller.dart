import 'package:get/get.dart';

class PaymentController extends GetxController {
  dynamic argumentData = Get.arguments;
  String title = "";
  int price = 0, numPeople = 1;
  int totalPrice = 0;
  // var

  bool showListBank = false;
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
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
}
