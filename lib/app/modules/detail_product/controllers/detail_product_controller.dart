import 'package:get/get.dart';

class DetailProductController extends GetxController {
  bool isFavorite = false;

  @override
  void onInit() {
    super.onInit();
  }

  void changeFavorite() {
    isFavorite = !isFavorite;
    update();
  }
}
