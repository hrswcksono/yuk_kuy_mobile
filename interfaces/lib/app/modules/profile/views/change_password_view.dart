import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/controllers/profile_controller.dart';

import '../../../widgets/header_global.dart';
import '../../../widgets/text_field_global.dart';

// ignore: must_be_immutable
class ChangePasswordView extends GetView {
  ChangePasswordView({Key? key}) : super(key: key);
  var profileC = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profileC.initPasswordTF();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const HeaderGlobal(
                title: "Change Password",
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/img_lock.png',
                height: 110,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldGlobal(
                title: "Old Password",
                value: profileC.oldPassword,
                obsTxt: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldGlobal(
                title: "New Password",
                value: profileC.newPassword,
                obsTxt: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldGlobal(
                title: "Confirm Password",
                value: profileC.confirmPassword,
                obsTxt: true,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  profileC.editPassword();
                },
                child: Text("Submit",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
