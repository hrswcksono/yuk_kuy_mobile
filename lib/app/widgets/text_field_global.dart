import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldGlobal extends StatelessWidget {
  const TextFieldGlobal(
      {super.key, required this.title, this.value, this.obsTxt, this.ctx});

  final String title;
  final TextEditingController? value;
  final bool? obsTxt;
  final GetxController? ctx;

  @override
  Widget build(BuildContext context) {
    var statObs = obsTxt ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          )),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: statObs,
          controller: value,
          decoration: InputDecoration(
            hintText: title,
            // suffixIcon: IconButton(
            //   onPressed: () {},
            //   icon: icon,
            // ),
          ),
        ),
      ],
    );
  }
}
