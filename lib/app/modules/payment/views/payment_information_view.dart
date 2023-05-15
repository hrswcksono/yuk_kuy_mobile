import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_verification_view.dart';

import '../../../../core/themes/colors.dart';
import 'components/payment_header.dart';

class PaymentInformationView extends GetView {
  PaymentInformationView(this.id, this.accountId, {Key? key}) : super(key: key);
  final int? id;
  final int? accountId;
  var paymentC = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    paymentC.detailOrder(id!, accountId!);
    return Scaffold(
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
                              Text("Rp. ${data!.item1.data!.totalPrice}",
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
                      ListView.separated(
                        padding: const EdgeInsets.all(20),
                        itemCount: data.item2.data!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return BankInformation(
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
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(PaymentVerificationView(data.item2.data!));
                        },
                        child: Text("Payment Verification",
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

  Row BankInformation(String bankName, String name, String number) {
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
