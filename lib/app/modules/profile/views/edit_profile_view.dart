import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/data/models/profile_model.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/controllers/profile_controller.dart';
import 'package:yuk_kuy_mobile/app/widgets/header_global.dart';

import '../../../widgets/text_field_global.dart';

// ignore: must_be_immutable
class EditProfileView extends GetView {
  EditProfileView(this.data, {Key? key}) : super(key: key);
  final ProfileItem data;
  var profileC = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profileC.initEdit(data);
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
                  title: "Edit Profile",
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldGlobal(
                  title: "Name",
                  value: profileC.editName,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Username",
                  value: profileC.editUsername,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Email",
                  value: profileC.editEmail,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Phone",
                  value: profileC.editPhone,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Address",
                  value: profileC.editAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    profileC.editData();
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
