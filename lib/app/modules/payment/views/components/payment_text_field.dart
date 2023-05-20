// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField({super.key, required this.title, required this.value});

  final String title;
  final TextEditingController value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title :",
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            fontSize: 16,
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
