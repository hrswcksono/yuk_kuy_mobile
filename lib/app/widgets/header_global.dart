import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderGlobal extends StatelessWidget {
  const HeaderGlobal({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 246, 250, 1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                // size: 16.35,
              )),
        ),
        const SizedBox(
          width: 25,
        ),
        Text(
          title,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )),
        ),
      ],
    );
  }
}
