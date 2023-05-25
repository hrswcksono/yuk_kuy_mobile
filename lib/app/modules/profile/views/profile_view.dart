import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/profile_model.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/views/change_password_view.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/views/edit_profile_view.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/widget_extention.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/values/consts.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  // var controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.onRefresh,
          child: SizedBox(
            height: Get.height * 0.92 - Get.mediaQuery.viewPadding.top,
            width: Get.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    InkWell(
                      onTap: () => controller.logout(),
                      child: Container(
                        height: 30,
                        width: 33,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: CustomColor.mainGreen,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                        ),
                        child: Image.asset(
                          'assets/icons/ic_exit.png',
                        ),
                      ),
                    ),
                  ],
                ).margin(all: 20),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: Get.height * 0.778,
                  child: controller.obx(
                    (data) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "${Consts.urlImg}${data!.data!.profile!.avatar.toString()}"))),
                              ),
                              Positioned(
                                right: 12,
                                bottom: 12,
                                child: InkWell(
                                  onTap: () {
                                    Get.dialog(
                                        changeAvatarDialog(data, controller));
                                    controller.imageProduct = null;
                                    controller.update();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: CustomColor.mainGreen,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                        'assets/icons/ic_edit_avatar.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            data.data!.username.toString(),
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
                            data.data!.name.toString(),
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
                                Visibility(
                                  visible:
                                      data.data!.profile!.address != null &&
                                          data.data!.profile!.address != "",
                                  child: Row(
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
                                          data.data!.profile!.address
                                              .toString(),
                                          style: GoogleFonts.inter(
                                              textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromRGBO(
                                                143, 149, 158, 1),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: data.data!.profile!.phone != null &&
                                      data.data!.profile!.phone != "",
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/icons/ic_phone.png",
                                        width: 20,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        data.data!.profile!.phone.toString(),
                                        style: GoogleFonts.inter(
                                            textStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(143, 149, 158, 1),
                                        )),
                                      ),
                                    ],
                                  ),
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
                                      data.data!.email.toString(),
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
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(EditProfileView(data.data!));
                              },
                              child: Text("Edit Profile",
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )))),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(ChangePasswordView());
                            },
                            child: Text("Change Password",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    onError: (_) => SizedBox(
                      height: Get.height,
                      child: Center(
                        child: Lottie.asset(
                            'assets/lotties/error-doodle-animation.zip',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column changeAvatarDialog(ProfileModel data, ProfileController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 150),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 180,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Change Avatar",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    const SizedBox(height: 15),
                    GetBuilder<ProfileController>(
                        init: ProfileController(),
                        builder: (ctx) {
                          return ctx.imageProduct != null
                              ? Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(ctx.imageProduct!),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${Consts.urlImg}${data.data!.profile!.avatar.toString()}"),
                                    ),
                                  ),
                                );
                        }),
                    const SizedBox(height: 20),
                    GetBuilder<ProfileController>(
                        init: ProfileController(),
                        builder: (context) {
                          return Column(
                            children: [
                              Visibility(
                                visible: context.imageProduct == null,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.addImage("Gallery");
                                    context.update();
                                  },
                                  child: Text("Change Avatar",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ))),
                                ),
                              ),
                              Visibility(
                                visible: context.imageProduct != null,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.changeAvatar();
                                    context.update();
                                  },
                                  child: Text("Submit",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ))),
                                ),
                              )
                            ],
                          );
                        }),
                    //Buttons
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
