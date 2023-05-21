import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';

import '../../../../core/themes/colors.dart';
import '../../../data/models/bank_model.dart';
import 'components/payment_header.dart';

// ignore: must_be_immutable
class PaymentVerificationView extends GetView {
  PaymentVerificationView(this.item, this.orderId, {Key? key})
      : super(key: key);
  var paymentC = Get.put(PaymentController());

  final List<BankItem> item;
  final int? orderId;
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
                const SizedBox(
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
                                  ctx.nameBankSelected,
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
                          itemCount: item.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return chooseBank(
                                item[index].bank!, ctx, item[index].id!);
                          })
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    paymentC.verifOrder(orderId!);
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

  InkWell chooseBank(String name, PaymentController ctx, int idBank) {
    return InkWell(
      onTap: () {
        ctx.nameBankSelected = name;
        ctx.idBank = idBank;
        ctx.update();
        ctx.stateListBank();
      },
      child: Container(
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
              name,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
