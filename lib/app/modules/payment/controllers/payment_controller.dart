import 'package:get/get.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  bool showListBank = false;
  @override
  void onInit() {
    super.onInit();
  }

  void stateListBank() {
    showListBank = !showListBank;
    update();
  }
}
