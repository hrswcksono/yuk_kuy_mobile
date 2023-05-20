import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';

class BaseController extends GetxController {
  //TODO: Implement BaseController

  var indexTab = 0;

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    indexTab = 0;
    update();
    super.onInit();
  }

  void moved() {
    Get.offAllNamed(AppPages.INITIAL_B);
    indexTab = 1;
    print('indextab $indexTab');
    update();
  }

  void changeIndexTab(int index) {
    indexTab = index;
    update();
  }
}
