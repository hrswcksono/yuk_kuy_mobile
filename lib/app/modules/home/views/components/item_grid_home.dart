import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_model.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';
import 'package:yuk_kuy_mobile/core/values/consts.dart';

class ItemGridHome extends StatelessWidget {
  const ItemGridHome({super.key, required this.model});

  final ProductItem model;

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
                  image:
                      NetworkImage(Consts.urlImg + model.imageProducts[0].src),
                ),
                color: Colors.amberAccent),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            model.name,
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
            "${model.dateStart.toIso8601String().toFormatedDate} - ${model.dateEnd.toIso8601String().toFormatedDate}",
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
            model.price.toString(),
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
