import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_verification_view.dart';

import '../../../../core/themes/colors.dart';
import 'components/payment_header.dart';

class PaymentInformationView extends GetView {
  PaymentInformationView({Key? key}) : super(key: key);
  var paymentC = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const PaymentHeader(
                title: "Payment Information",
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 129,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: CustomColor.mainGreen,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Amount :",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ))),
                      Text("Rp. 1.000.xxx",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(PaymentVerificationView());
                },
                child: Text("Payment Verification",
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
    );
  }
}
