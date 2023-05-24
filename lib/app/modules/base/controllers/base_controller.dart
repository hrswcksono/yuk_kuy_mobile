import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/controllers/profile_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';

class BaseController extends GetxController {
  var homeC = Get.put(HomeController());
  var transC = Get.put(TransactionController());
  var favC = Get.put(FavoriteController());
  var profC = Get.put(ProfileController());

  var indexTab = 0;

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    indexTab = 0;
    update();
    super.onInit();
  }

  void moved() {
    Get.offAllNamed(AppPages.initialB);
    indexTab = 1;
    update();
  }

  void changeIndexTab(int index) {
    indexTab = index;
    switch (indexTab) {
      case 0:
        homeC.moveData();
        break;
      case 1:
        transC.moveData();
        break;
      case 2:
        favC.onInit();
        break;
      case 3:
        profC.onInit();
        break;
    }
    update();
  }
}
