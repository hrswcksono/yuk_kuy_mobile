import 'package:get/get.dart';

class TransactionController extends GetxController {
  List<bool> stateFilter = [true, false, false, false, false, false];

  @override
  void onInit() {
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void changeState(int index) {
    stateFilter[index] = !stateFilter[index];
    update();
  }
}
