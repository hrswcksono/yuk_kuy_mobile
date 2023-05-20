import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/header_global.dart';

class VerificationPendingView extends GetView {
  const VerificationPendingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: Get.width - 40,
            height: Get.height - 40 - Get.mediaQuery.viewPadding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeaderGlobal(
                  title: "Verification Pending",
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/img_pending.png",
                  height: 160,
                  width: 184,
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Message :",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(69, 131, 236, 1),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please wait a moment, we are processing your transaction.",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
