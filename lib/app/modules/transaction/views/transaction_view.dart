import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/order_canceled_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/verification_pending_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/verification_rejected_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/verification_success_view.dart';
import 'package:yuk_kuy_mobile/core/values/strings.dart';

import '../../../../core/values/strings/dummy_string.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Transaction",
                style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Strings.filterTransaction.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0 ||
                      index == (Strings.filterTransaction.length)) {
                    return const SizedBox(
                      width: 20,
                    );
                  } else {
                    return const SizedBox(
                      width: 5,
                    );
                  }
                },
                separatorBuilder: (BuildContext context, int index) =>
                    ActionChip(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    side: BorderSide(
                      color: Color.fromRGBO(179, 179, 179, 1),
                      width: 1.5,
                    ),
                  ),
                  label: Text(
                    Strings.filterTransaction[index],
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(153, 153, 153, 1),
                    )),
                  ),
                  backgroundColor: Colors.white,
                  // disabledColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: DummyString.listTransaction.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return itemTransaction(
                    DummyString.listTransaction[index]["title"],
                    DummyString.listTransaction[index]["user"],
                    DummyString.listTransaction[index]["time"],
                    DummyString.listTransaction[index]["pax"],
                    DummyString.listTransaction[index]["price"],
                    DummyString.listTransaction[index]["status"],
                    DummyString.listTransaction[index]["image"]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  InkWell itemTransaction(
    String title,
    String user,
    String date,
    int pax,
    int price,
    String status,
    String image,
  ) {
    return InkWell(
      onTap: () {
        if (status == "payment") {
          Get.to(PaymentView());
        } else if (status == "verification") {
          Get.to(VerificationPendingView());
        } else if (status == "success") {
          Get.to(VerificationSuccessView());
        } else if (status == "rejected") {
          Get.to(VerificationRejectedView());
        } else if (status == "canceled") {
          Get.to(OrderCanceledView());
        }
      },
      child: Container(
        height: 90,
        width: Get.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0x73000000),
              blurRadius: 2.0,
              spreadRadius: 1,
              offset: new Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.5),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 73,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      matchTextDirection: true,
                      repeat: ImageRepeat.noRepeat,
                      image: AssetImage(image),
                    ),
                    color: Colors.amberAccent),
              ),
              const SizedBox(
                width: 8.5,
              ),
              SizedBox(
                width: Get.width - (4 * 8.5 + 43 + 75),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        const Spacer(),
                        Text(
                          status,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        // Spacer()
                      ],
                    ),
                    Text(
                      "by : $user",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(143, 149, 158, 1),
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      date,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(143, 149, 158, 1),
                      )),
                    ),
                    const Spacer(),
                    Row(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pax : $pax",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        const Spacer(),
                        Text(
                          "Price : IDR. $price",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        // Spacer()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
