import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_verification_view.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/int_extentions.dart';

import '../../../../core/themes/colors.dart';
import 'components/payment_header.dart';

// ignore: must_be_immutable
class PaymentInformationView extends GetView {
  PaymentInformationView(this.id, this.accountId, this.btnCancel, {Key? key})
      : super(key: key);
  final int? id;
  final int? accountId;
  final bool btnCancel;
  var paymentC = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    paymentC.detailOrder(id!, accountId!);
    paymentC.initPaymentVerification();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SmartRefresher(
          controller: paymentC.refreshController,
          onRefresh: paymentC.onRefresh,
          child: Expanded(
            child: paymentC.obx((data) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
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
                              Text(data!.item1.data!.totalPrice!.toRupiah,
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
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(20),
                          itemCount: data.item2.data!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return bankInformation(
                              data.item2.data![index].bank.toString(),
                              data.item2.data![index].name.toString(),
                              data.item2.data![index].number.toString(),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 5,
                            );
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: btnCancel,
                            child: Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          paymentC.showDialogCancel();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          side: const BorderSide(
                                              width: 2, // the thickness
                                              color: Color.fromRGBO(255, 79, 79,
                                                  1) // the color of the border
                                              ),
                                        ),
                                        child: Text("Cancel Book",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.inter(
                                                textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  255, 79, 79, 1),
                                            ))),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(PaymentVerificationView(
                                    data.item2.data!, data.item1.data!.id));
                              },
                              child: Text("Payment Verification",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Row bankInformation(String bankName, String name, String number) {
    return Row(
      children: [
        Text(bankName,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ))),
        const SizedBox(
          width: 5,
        ),
        Text("$number an $name",
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            )))
      ],
    );
  }
}
