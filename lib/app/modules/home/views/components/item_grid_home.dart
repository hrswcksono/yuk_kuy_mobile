import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemGridHome extends StatelessWidget {
  const ItemGridHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
