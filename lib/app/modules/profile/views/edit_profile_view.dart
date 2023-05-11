import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/views/change_password_view.dart';
import 'package:yuk_kuy_mobile/app/widgets/header_global.dart';

import '../../../../core/themes/colors.dart';
import '../../../widgets/text_field_global.dart';
import '../../payment/views/components/payment_header.dart';

class EditProfileView extends GetView {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                HeaderGlobal(
                  title: "Edit Profile",
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldGlobal(
                  title: "Name",
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Username",
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Email",
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Phone",
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Address",
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Get.to(PaymentVerificationView());
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
