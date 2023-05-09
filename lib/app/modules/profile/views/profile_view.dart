import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/views/edit_profile_view.dart';

import '../../../../core/themes/colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Profile",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: CustomColor.mainGreen,
                      shape: BoxShape.circle,
                    ),
                    // child: const Icon(
                    //   Icons.add,
                    //   // size: 16.35,
                    //   color: Colors.white,
                    // ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Username",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Name",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(143, 149, 158, 1),
                    )),
                  ),
                  const SizedBox(
                    height: 9,
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
                                "Mangga Street no 5, Petir District Serang City, Banten Province",
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
                              "+6281783728732",
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
                              "mail@mail.com",
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(143, 149, 158, 1),
                              )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(EditProfileView());
                      },
                      child: Text("Edit Profile"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
