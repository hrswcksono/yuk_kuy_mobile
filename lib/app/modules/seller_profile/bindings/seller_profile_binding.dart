import 'package:get/get.dart';

import '../controllers/seller_profile_controller.dart';

class SellerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellerProfileController>(
      () => SellerProfileController(),
    );
  }
}
