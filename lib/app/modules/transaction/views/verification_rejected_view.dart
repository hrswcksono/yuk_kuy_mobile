import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationRejectedView extends GetView {
  const VerificationRejectedView({Key? key}) : super(key: key);
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
                        "Verification Rejected",
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
                  "assets/images/img_rejected.png",
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
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Get.to(PaymentVerificationView());
                  },
                  child: Text("Verification Again",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Cancel Book",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 79, 79, 1),
                      ))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(
                        width: 2, // the thickness
                        color: Color.fromRGBO(
                            255, 79, 79, 1) // the color of the border
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
