import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/header_global.dart';
import '../../../widgets/text_field_global.dart';

class ChangePasswordView extends GetView {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                const TextFieldGlobal(
                  title: "Old Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldGlobal(
                  title: "New Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldGlobal(
                  title: "Confirm Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
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
