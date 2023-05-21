import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/widget_extention.dart';
import 'package:yuk_kuy_mobile/core/values/consts.dart';

import '../../../widgets/header_global.dart';
import '../controllers/seller_profile_controller.dart';

class SellerProfileView extends GetView<SellerProfileController> {
  const SellerProfileView({Key? key}) : super(key: key);

  // var ctrl = Get.put(SellerProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx((data) => Column(
              children: [
                HeaderGlobal(
                  title: data!.name.toString(),
                ).margin(horizontal: 20, vertical: 5),
                SizedBox(
                  width: Get.width,
                  height: 210,
                  child: Stack(
                    children: [
                      Image.network(
                        Consts.urlImg + data.profile!.bannerImage.toString(),
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: 128,
                      ),
                      Positioned(
                        bottom: 0,
                        left: Get.width / 2 - (155 / 2),
                        child: Container(
                          height: 155,
                          width: 155,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(Consts.urlImg +
                                      data.profile!.avatar.toString()))),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.username.toString(),
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: Get.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/ic_location.png",
                                width: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Text(
                                  data.profile!.address.toString(),
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(143, 149, 158, 1),
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/ic_mail.png",
                                width: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                data.email.toString(),
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(143, 149, 158, 1),
                                )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/ic_phone.png",
                                width: 20,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                data.profile!.phone.toString(),
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(143, 149, 158, 1),
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          List.generate(data.socialAccounts!.length, (index) {
                        if (data.socialAccounts![index].platform ==
                            "facebook") {
                          return SizedBox(
                            width: 50,
                            child: SignInButton.mini(
                              buttonType: ButtonType.facebook,
                              onPressed: () {},
                            ),
                          );
                        } else {
                          return SizedBox(
                            width: 50,
                            child: SignInButton.mini(
                              buttonType: ButtonType.instagram,
                              onPressed: () {},
                            ),
                          );
                        }
                      }),
                    ),
                  ],
                ).margin(horizontal: 20)
              ],
            )),
      ),
    );
  }
}
