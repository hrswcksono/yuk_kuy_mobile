import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/controllers/profile_controller.dart';

import '../../../widgets/header_global.dart';
import '../../../widgets/text_field_global.dart';

class ChangePasswordView extends GetView {
  ChangePasswordView({Key? key}) : super(key: key);
  var profileC = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profileC.initPasswordTF();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                  value: profileC.newPassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "New Password",
                  value: profileC.newPassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Confirm Password",
                  value: profileC.confirmPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
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
      ),
    );
  }
}
