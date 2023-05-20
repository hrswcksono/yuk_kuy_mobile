import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/data/models/favorite_model.dart';
import 'package:yuk_kuy_mobile/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/int_extentions.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';

import '../../../../../core/values/consts.dart';
import '../../../../routes/app_pages.dart';

class ItemGridFavorite extends StatelessWidget {
  ItemGridFavorite({super.key, required this.model, required this.state});

  var favC = Get.put(FavoriteController());

  final FavoriteModel model;
  final int state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppPages.INITIAL_DP,
          arguments: {"id": model.id},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 178.69,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      matchTextDirection: true,
                      repeat: ImageRepeat.noRepeat,
                      image: NetworkImage('${Consts.urlImg}${model.image}'),
                    ),
                    color: Colors.white),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: GetBuilder<FavoriteController>(
                    init: FavoriteController(),
                    builder: (context) {
                      return InkWell(
                        onTap: () {
                          favC.unFavorited(model, state);
                        },
                        child: favC.stateFavorited[state]
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ),
                      );
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            model.name.toString(),
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            )),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            "${model.dateStart.toFormatedDate} - ${model.dateEnd.toFormatedDate}",
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(143, 149, 158, 1))),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            model.price.toPrice,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
    );
  }
}
