import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie_player/lottie_player.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/modules/favorite/views/components/item_grid_favorite.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  FavoriteView({Key? key}) : super(key: key);
  var favC = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: favC.refreshController,
          onRefresh: favC.onRefresh,
          child: controller.obx(
            (data) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favorite",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 25,
                        children: List.generate(
                          data!.length,
                          (index) => ItemGridFavorite(
                            model: data[index],
                            state: index,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            onEmpty: const LottiePlayer(
              networkUrl:
                  'https://assets10.lottiefiles.com/packages/lf20_NeuXI2OPLG.json',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
