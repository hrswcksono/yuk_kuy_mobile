import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/widget_extention.dart';
import 'package:yuk_kuy_mobile/core/values/consts.dart';

import '../../../widgets/header_global.dart';
import '../controllers/seller_profile_controller.dart';

class SellerProfileView extends GetView<SellerProfileController> {
  const SellerProfileView({Key? key}) : super(key: key);

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
                  height: 250,
                  child: Stack(
                    children: [
                      Image.network(
                        Consts.urlImg + data.profile!.bannerImage.toString(),
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: 175,
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
                          Visibility(
                            visible: data.profile!.address != null,
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/ic_location.png",
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                TextButton(
                                  onPressed: () async {
                                    var url =
                                        "https://www.google.com/maps/search/?api=1&query=${data.profile!.address.toString()}";
                                    if (await canLaunchUrl(Uri.parse(url))) {
                                      await launchUrl(Uri.parse(url));
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Text(data.profile!.address!,
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(143, 149, 158, 1),
                                      ))),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                              visible: data.email != null,
                              child: Column(
                                children: [
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
                                      TextButton(
                                        onPressed: () async {
                                          var url =
                                              "mailto:${data.email.toString()}";
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url));
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Text(data.email!,
                                            style: GoogleFonts.inter(
                                                textStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  143, 149, 158, 1),
                                            ))),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Visibility(
                              visible: data.profile!.phone != null,
                              child: Column(
                                children: [
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
                                      TextButton(
                                        onPressed: () async {
                                          var url =
                                              "tel:${data.profile!.phone.toString()}";
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url));
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child:
                                            Text(data.profile!.phone.toString(),
                                                style: GoogleFonts.inter(
                                                    textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                      143, 149, 158, 1),
                                                ))),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
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
                        if (data.socialAccounts![index].platform == "Twitter") {
                          return InkWell(
                            onTap: () async {
                              var url =
                                  "https://twitter.com/${data.socialAccounts![index].link.toString()}";
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            // Image tapped
                            splashColor: Colors.white10,
                            // Splash color over image
                            child: Ink.image(
                              fit: BoxFit.cover, // Fixes border issues
                              width: 50,
                              height: 50,
                              image: const AssetImage(
                                "assets/icons/ic_twitter.png",
                              ),
                            ),
                          );
                        } else if (data.socialAccounts![index].platform ==
                            "Youtube") {
                          return InkWell(
                            onTap: () async {
                              var url =
                                  "https://www.youtube.com/@${data.socialAccounts![index].link.toString()}";
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            // Image tapped
                            splashColor: Colors.white10,
                            // Splash color over image
                            child: Ink.image(
                              fit: BoxFit.cover, // Fixes border issues
                              width: 50,
                              height: 50,
                              image: const AssetImage(
                                "assets/icons/ic_youtube.png",
                              ),
                            ),
                          );
                        } else if (data.socialAccounts![index].platform ==
                            "Instagram") {
                          return InkWell(
                            onTap: () async {
                              var url =
                                  "https://www.instagram.com/${data.socialAccounts![index].link.toString()}/";
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            // Image tapped
                            splashColor: Colors.white10,
                            // Splash color over image
                            child: Ink.image(
                              fit: BoxFit.cover, // Fixes border issues
                              width: 50,
                              height: 50,
                              image: const AssetImage(
                                "assets/icons/ic_instagram.png",
                              ),
                            ),
                          );
                        } else if (data.socialAccounts![index].platform ==
                            "Tiktok") {
                          return InkWell(
                            onTap: () async {
                              var url =
                                  "https://www.tiktok.com/@${data.socialAccounts![index].link.toString()}/";
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            // Image tapped
                            splashColor: Colors.white10,
                            // Splash color over image
                            child: Ink.image(
                              fit: BoxFit.cover, // Fixes border issues
                              width: 50,
                              height: 50,
                              image: const AssetImage(
                                "assets/icons/ic_tiktok.png",
                              ),
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: () async {
                              ArtSweetAlert.show(
                                  context: Get.context!,
                                  artDialogArgs: ArtDialogArgs(
                                      type: ArtSweetAlertType.danger,
                                      title: "Error",
                                      text: "Undefined"));
                            },
                            // Image tapped
                            splashColor: Colors.white10,
                            // Splash color over image
                            child: Ink.image(
                              fit: BoxFit.cover, // Fixes border issues
                              width: 50,
                              height: 50,
                              image: const AssetImage(
                                "assets/icons/ic_ask.png",
                              ),
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
