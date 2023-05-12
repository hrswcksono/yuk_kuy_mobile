import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldGlobal extends StatelessWidget {
  const TextFieldGlobal({super.key, required this.title, this.value});

  final String title;
  final TextEditingController? value;

  @override
  Widget build(BuildContext context) {
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
          controller: value,
          decoration: InputDecoration(hintText: title),
        ),
      ],
    );
  }
}
