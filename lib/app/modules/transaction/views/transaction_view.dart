// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie_player/lottie_player.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/modules/detail_transaction/views/order_canceled_view.dart';
import 'package:yuk_kuy_mobile/app/modules/detail_transaction/views/verification_rejected_view.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_information_view.dart';
import 'package:yuk_kuy_mobile/app/modules/detail_transaction/views/verification_pending_view.dart';
import 'package:yuk_kuy_mobile/core/themes/colors.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/int_extentions.dart';
import 'package:yuk_kuy_mobile/core/values/strings.dart';

import '../../../../core/values/consts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/transaction_controller.dart';

class TransactionView extends GetView {
  TransactionView({Key? key}) : super(key: key);

  var transactionC = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SmartRefresher(
            controller: transactionC.refreshController,
            onRefresh: transactionC.onRefresh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.08,
                  child: Padding(
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
                ),
                SizedBox(
                  height: Get.height * 0.05,
                  child: GetBuilder<TransactionController>(
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
                                    index ==
                                        (Strings.filterTransaction.length)) {
                                  return const SizedBox(
                                    width: 20,
                                  );
                                } else {
                                  return const SizedBox(
                                    width: 5,
                                  );
                                }
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      filterTransaction(
                                index,
                                transactionC.stateFilter[index],
                                ctx,
                              ),
                            ),
                          )),
                ),
                SizedBox(
                  height: Get.height * 0.78 - (Get.mediaQuery.viewPadding.top),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: transactionC.obx(
                      (data) => ListView.separated(
                          padding:
                              const EdgeInsets.only(top: 10, left: 5, right: 5),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          controller: transactionC.scroll,
                          itemCount: data!.length,
                          itemBuilder: (BuildContext context, int index) =>
                              itemTransaction(
                                data[index].id!,
                                data[index].product!.accountId!,
                                data[index].product!.name.toString(),
                                data[index].name.toString(),
                                data[index].createdAt.toString(),
                                data[index].totalPackage!.toInt(),
                                data[index].totalPrice!.toInt(),
                                data[index].statusOrder!.status.toString(),
                                data[index]
                                    .product!
                                    .imageProducts![0]
                                    .src
                                    .toString(),
                                data[index].statusOrder!.reason.toString(),
                              ),
                          separatorBuilder: (_, __) => const SizedBox(
                                height: 5,
                              )),
                      onEmpty: SizedBox(
                        height: Get.height / 2,
                        child: const Center(
                          child: Material(
                            child: LottiePlayer(
                              networkUrl:
                                  'https://assets10.lottiefiles.com/datafiles/vhvOcuUkH41HdrL/data.json',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
    int orderId,
    int sellerId,
    String productName,
    String user,
    String date,
    int pax,
    int price,
    String status,
    String image,
    String reason,
  ) {
    return InkWell(
      onTap: () {
        if (status == "payment") {
          Get.to(PaymentInformationView(orderId, sellerId, true));
        } else if (status == "verification") {
          Get.to(const VerificationPendingView());
        } else if (status == "success") {
          Get.toNamed(AppPages.INITIAL_DT, arguments: {"orderId": orderId});
        } else if (status == "reject") {
          Get.to(VerificationRejectedView(orderId, sellerId, reason));
        } else if (status == "cancel") {
          Get.to(OrderCanceledView(reason));
        }
      },
      child: Container(
        height: 90,
        width: Get.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x73000000),
              blurRadius: 2.0,
              spreadRadius: 1,
              offset: Offset(0.0, 2.0),
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
                      image: NetworkImage('${Consts.urlImg}$image'),
                    ),
                    color: Colors.white),
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
                          productName,
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
                                return const Color.fromRGBO(4, 193, 234, 1);
                              } else if (status == 'verification') {
                                return const Color.fromRGBO(255, 217, 63, 1);
                              } else if (status == 'success') {
                                return const Color.fromRGBO(83, 177, 117, 1);
                              } else if (status == 'reject') {
                                return const Color.fromRGBO(255, 79, 7, 1);
                              } else if (status == 'cancel') {
                                return const Color.fromRGBO(159, 64, 64, 1);
                              }
                            }()),
                            borderRadius: const BorderRadius.only(
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
                          "Price : ${price.toRupiah}",
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
