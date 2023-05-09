import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/app_pages.dart';

class ItemGridFavorite extends StatelessWidget {
  const ItemGridFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppPages.INITIAL_DP);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 178.69,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      matchTextDirection: true,
                      repeat: ImageRepeat.noRepeat,
                      image: AssetImage("assets/images/image_trip.jpg"),
                    ),
                    color: Colors.amberAccent),
              ),
              const Positioned(
                top: 5,
                right: 5,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "Komodo Island",
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
            '3 Mei 2023 - 5 Mei 2023',
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
            "IDR. 7jt/pax",
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
