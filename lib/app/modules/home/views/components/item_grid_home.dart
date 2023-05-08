import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';

class ItemGridHome extends StatelessWidget {
  const ItemGridHome({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.price,
  });

  final String image;
  final String title;
  final String date;
  final String price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppPages.INITIAL_DP);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 178.69,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  matchTextDirection: true,
                  repeat: ImageRepeat.noRepeat,
                  image: AssetImage(image),
                ),
                color: Colors.amberAccent),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
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
            date.toFormatedDate,
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
            price,
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
