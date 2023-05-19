import 'package:get/get.dart';

import '../controllers/tour_profile_controller.dart';

class TourProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TourProfileController>(
      () => TourProfileController(),
    );
  }
}
