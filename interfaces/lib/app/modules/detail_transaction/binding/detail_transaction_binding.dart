import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/modules/detail_transaction/controllers/detail_transaction_controller.dart';

class DetailTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTransactionController>(
      () => DetailTransactionController(),
    );
  }
}
