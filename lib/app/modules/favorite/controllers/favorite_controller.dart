import 'package:get/get.dart';

import '../../../../core/utils/helpers.dart';
import '../../../data/models/product_detail_model.dart';

class FavoriteController extends GetxController
    with StateMixin<List<ProductDetailItem>> {
  var listFavorite = List<ProductDetailItem>.empty();

  final count = 0.obs;
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    listFavorite = readListFavorite();
    change(listFavorite, status: RxStatus.success());
  }
}
