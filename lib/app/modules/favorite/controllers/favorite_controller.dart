import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/utils/helpers.dart';
import '../../../data/models/favorite_model.dart';

class FavoriteController extends GetxController
    with StateMixin<List<FavoriteModel>> {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;

  List<bool> stateFavorited = [];

  final count = 0.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    var listFavorite = readFavorite();
    var listFavModel = List<FavoriteModel>.empty(growable: true);
    stateFavorited.clear();
    listFavorite.forEach((data) => {
          listFavModel.add(FavoriteModel(
              id: data[0]!,
              name: data[1].toString(),
              price: data[5]!,
              dateStart: data[2].toString(),
              dateEnd: data[3].toString(),
              image: data[4].toString())),
          stateFavorited.add(true),
          update()
        });
    if (listFavModel.isNotEmpty) {
      change(listFavModel, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  void unFavorited(FavoriteModel data, int index) {
    stateFavorited[index] = false;
    update();
    deleteFavorite(data);
    ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Unfavorite",
            text: "${data.name} removed from favourites"));
    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
      initData();
    });
  }

  void onRefresh() async {
    isLoading = false;
    update();
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000), () {
      initData();
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }
}
