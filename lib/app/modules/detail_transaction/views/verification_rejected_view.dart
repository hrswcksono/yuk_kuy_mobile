import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_information_view.dart';

import '../../../widgets/header_global.dart';

// ignore: must_be_immutable
class VerificationRejectedView extends GetView {
  final int orderId;
  final int sellerId;
  final String reason;

  VerificationRejectedView(this.orderId, this.sellerId, this.reason, {Key? key})
      : super(key: key);
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
                  title: "Verification Rejected",
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
                ElevatedButton(
                  onPressed: () {
                    Get.to(PaymentInformationView(orderId, sellerId, false));
                  },
                  child: Text("Verification Again",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    paymentC.showDialogCancel();
                  },
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
                  child: Text("Cancel Book",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 79, 79, 1),
                      ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
