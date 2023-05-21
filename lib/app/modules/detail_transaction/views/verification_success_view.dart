import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/detail_transaction/controllers/detail_transaction_controller.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/int_extentions.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';

import '../../../widgets/header_global.dart';

class VerificationSuccessView extends GetView<DetailTransactionController> {
  VerificationSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (data) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: Get.width - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const HeaderGlobal(
                      title: "Verification Success",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/img_success.png",
                      height: 160,
                      width: 184,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Transaction Number : ${data?.data?.id}",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(69, 131, 236, 1),
                      )),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData("Product Name :", data!.data!.product!.name!),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData("Date Tour :",
                        "${data.data?.product?.dateStart?.toString().toFormatedDate} - ${data.data?.product?.dateEnd?.toString().toFormatedDate}"),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData("Order By :", data.data!.name!),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData(
                        "Amount Ticket :", data.data!.totalPackage.toString()),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData("Date Order :",
                        data.data!.createdAt.toString().toFormatedDate),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData("Amount Price :", data.data!.totalPrice!.toRupiah),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData("Vendor :", data.data!.seller!.name!),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Gathering Point :",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(69, 131, 236, 1),
                      )),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      data.data!.product!.addressMeetingPoint!,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    itemData("Tour Guide :", data.data!.guide!.name!),
                    const SizedBox(
                      height: 7,
                    ),
                    itemData("Phone :", data.data!.guide!.phone!)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row itemData(String tag, String content) {
    return Row(
      children: [
        Text(
          tag,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(143, 149, 158, 1),
          )),
        ),
        const Spacer(),
        Text(
          content,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          )),
        ),
      ],
    );
  }
}
