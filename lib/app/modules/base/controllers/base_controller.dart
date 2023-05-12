import 'package:get/get.dart';

class BaseController extends GetxController {
  //TODO: Implement BaseController

  var indexTab = 0;

  @override
  void onInit() {
    indexTab = 0;
    update();
    super.onInit();
  }

  void changeIndexTab(int index) {
    indexTab = index;
    update();
  }
}
