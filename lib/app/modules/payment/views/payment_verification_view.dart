import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/base/views/base_view.dart';
import 'package:yuk_kuy_mobile/app/modules/home/views/home_view.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';

import '../../../../core/themes/colors.dart';
import 'components/payment_header.dart';

class PaymentVerificationView extends GetView {
  PaymentVerificationView({Key? key}) : super(key: key);
  var paymentC = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    paymentC.initVerification();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const PaymentHeader(
                  title: "Payment Verification",
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<PaymentController>(
                    init: PaymentController(),
                    builder: (ctx) {
                      return InkWell(
                        onTap: () {
                          ctx.addImage("Gallery");
                        },
                        child: Container(
                          height: 204,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                color: CustomColor.mainGreen,
                                width: 1.5,
                              )),
                          child: ctx.imgVerification == null
                              ? Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 50,
                                    color: CustomColor.mainGreen,
                                  ),
                                )
                              : Image.file(
                                  ctx.imgVerification!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<PaymentController>(
                    init: PaymentController(),
                    builder: (ctx) => InkWell(
                          onTap: () => ctx.stateListBank(),
                          child: Container(
                            height: 33,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                  color: CustomColor.mainGreen,
                                  width: 1.5,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "BRI",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                GetBuilder<PaymentController>(
                  init: PaymentController(),
                  builder: (ctx) => ctx.showListBank
                      ? ListView.builder(
                          // padding: const EdgeInsets.all(8),
                          itemCount: 5,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return chooseBank();
                          })
                      : SizedBox(),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(const BaseView());
                  },
                  child: Text("Submit",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container chooseBank() {
    return Container(
      height: 33,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: CustomColor.mainGreen,
            width: 1.5,
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "BRI",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
