import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                SizedBox(
                  width: Get.width - 150,
                  child: Row(
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
                        width: 10,
                      ),
                      Text(
                        "Verification Pending",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/img_pending.png",
                  height: 160,
                  width: 184,
                ),
                SizedBox(
                  height: 20,
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
                    "Your xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
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
