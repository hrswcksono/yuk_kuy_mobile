import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/widget_extention.dart';

import '../../../widgets/header_global.dart';
import '../controllers/tour_profile_controller.dart';

class TourProfileView extends GetView<TourProfileController> {
  const TourProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderGlobal(
              title: "Name Seller",
            ).margin(horizontal: 20, vertical: 5),
            SizedBox(
              width: Get.width,
              height: 210,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/borobudur.jpg",
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
                              image:
                                  AssetImage("assets/images/borobudur.jpg"))),
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
                  "Name",
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
                              "dsadasdas",
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
                            "hjdgahsdas",
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
                            "hdghasdas",
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
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 50,
                      child: SignInButton.mini(
                        buttonType: ButtonType.facebook,
                        onPressed: () {},
                      ),
                    );
                  }),
                ),
              ],
            ).margin(horizontal: 20)
          ],
        ),
      ),
    );
  }
}
