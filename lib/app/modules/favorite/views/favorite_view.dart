import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/favorite/views/components/item_grid_favorite.dart';

import '../../home/views/components/item_grid_home.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                SizedBox(
                  height: 20,
                ),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 25,
                  children: List.generate(
                    10,
                    (index) => ItemGridFavorite(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
