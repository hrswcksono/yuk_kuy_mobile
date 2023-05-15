import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/components/payment_text_field.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_information_view.dart';
import 'package:yuk_kuy_mobile/app/widgets/text_field_global.dart';
import 'package:yuk_kuy_mobile/core/themes/colors.dart';

import '../controllers/payment_controller.dart';
import 'components/payment_header.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({Key? key}) : super(key: key);
  dynamic argumentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.initData(argumentData["data"]);
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
                title: "Payment",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.title,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  Text(
                    "IDR. ${controller.price}M/pax",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(143, 149, 158, 1))),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color.fromRGBO(239, 240, 245, 1),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<PaymentController>(
                  init: PaymentController(),
                  builder: (ctx) => Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of people :",
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => controller.reducePeople(),
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: CustomColor.mainGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  // size: 16.35,
                                  color: Colors.white,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              ctx.numPeople.toString(),
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.addPeople(),
                            child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: CustomColor.mainGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  // size: 16.35,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      )),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color.fromRGBO(239, 240, 245, 1),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              PaymentTextField(
                title: "Name",
                value: controller.name,
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentTextField(
                title: "Phone",
                value: controller.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentTextField(
                title: "Email",
                value: controller.email,
              ),
              // ElevatedButton(onPressed: () {}, child: const Text("Book Now"))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0, // soften the shadow
              spreadRadius: 5.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 5  horizontally
                5.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Price",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  GetBuilder<PaymentController>(
                      init: PaymentController(),
                      builder: (context) {
                        return Text(
                          "IDR. ${controller.totalPrice}",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                        );
                      }),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  controller.addOrder();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    100,
                    48,
                  ),
                  elevation: 0,
                  textStyle: GoogleFonts.inter(),
                  backgroundColor: CustomColor.mainGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Book \nnow",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
