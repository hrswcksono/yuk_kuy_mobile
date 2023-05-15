import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_information_view.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/order_canceled_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/verification_pending_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/verification_rejected_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/verification_success_view.dart';
import 'package:yuk_kuy_mobile/core/themes/colors.dart';
import 'package:yuk_kuy_mobile/core/values/strings.dart';

import '../../../../core/values/strings/dummy_string.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView {
  TransactionView({Key? key}) : super(key: key);

  var transactionC = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SmartRefresher(
        controller: transactionC.refreshController,
        onRefresh: transactionC.onRefresh,
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
              GetBuilder<TransactionController>(
                  init: TransactionController(),
                  builder: (ctx) => SizedBox(
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
                              filterTransaction(
                            index,
                            transactionC.stateFilter[index],
                            ctx,
                          ),
                        ),
                      )),
              const SizedBox(
                height: 15,
              ),
              transactionC.obx((data) => ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: data!.data!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return itemTransaction(
                          data.data![index].id!,
                          data.data![index].product!.accountId!,
                          data.data![index].product!.name.toString(),
                          data.data![index].name.toString(),
                          data.data![index].createdAt.toString(),
                          data.data![index].totalPackage!.toInt(),
                          data.data![index].totalPrice!.toInt(),
                          data.data![index].statusOrder!.status.toString(),
                          DummyString.listTransaction[index]["image"]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 10,
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  ActionChip filterTransaction(
      int index, bool state, TransactionController ctx) {
    return ActionChip(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        side: BorderSide(
          color: state
              ? CustomColor.mainGreen
              : const Color.fromRGBO(179, 179, 179, 1),
          width: 1.5,
        ),
      ),
      label: Text(
        Strings.filterTransaction[index],
        style: GoogleFonts.inter(
            textStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: state
              ? CustomColor.mainGreen
              : const Color.fromRGBO(153, 153, 153, 1),
        )),
      ),
      backgroundColor:
          state ? const Color.fromRGBO(233, 251, 243, 1) : Colors.white,
      // disabledColor: Colors.white,
      onPressed: () {
        ctx.changeState(index);
      },
    );
  }

  InkWell itemTransaction(
    int id,
    int accountId,
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
          Get.to(PaymentInformationView(id, accountId));
        } else if (status == "verification") {
          Get.to(const VerificationPendingView());
        } else if (status == "success") {
          Get.to(const VerificationSuccessView());
        } else if (status == "rejected") {
          Get.to(const VerificationRejectedView());
        } else if (status == "cancelled") {
          Get.to(const OrderCanceledView());
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
              offset: const Offset(0.0, 2.0),
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
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: (() {
                              if (status == 'payment') {
                                return Color.fromRGBO(4, 193, 234, 1);
                              } else if (status == 'verification') {
                                return Color.fromRGBO(255, 217, 63, 1);
                              } else if (status == 'success') {
                                return Color.fromRGBO(83, 177, 117, 1);
                              } else if (status == 'rejected') {
                                return Color.fromRGBO(255, 79, 7, 1);
                              } else if (status == 'cancelled') {
                                return Color.fromRGBO(159, 64, 64, 1);
                              }
                            }()),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8)),
                          ),
                          child: Text(
                            status,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                          ),
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
