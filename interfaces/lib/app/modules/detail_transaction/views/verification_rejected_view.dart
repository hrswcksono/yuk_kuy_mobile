import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';

import '../../../widgets/header_global.dart';

// ignore: must_be_immutable
class VerificationRejectedView extends GetView {
  final String reason;

  VerificationRejectedView(this.reason, {Key? key}) : super(key: key);
  var paymentC = Get.put(PaymentController());

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
                  title: "Rejected",
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/images/img_rejected.png",
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
                    reason,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
