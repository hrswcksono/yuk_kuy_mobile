import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/login_register/controllers/login_register_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/login_register/views/components/login_daftar_text_field.dart';
import 'package:yuk_kuy_mobile/app/modules/login_register/views/login_view.dart';
import 'package:yuk_kuy_mobile/app/widgets/text_field_global.dart';
import 'package:yuk_kuy_mobile/core/themes/colors.dart';

class RegisterView extends GetView {
  RegisterView({Key? key}) : super(key: key);
  var lrController = Get.put(LoginRegisterController());
  @override
  Widget build(BuildContext context) {
    lrController.initTextRegister();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset(
                  'assets/images/logo_yukkuy.png',
                  height: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldGlobal(
                  title: "Name",
                  value: lrController.nameRegisTF,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Username",
                  value: lrController.usernameRegisTF,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Email",
                  value: lrController.emailRegisTF,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Password",
                  value: lrController.passwordRegisTF,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldGlobal(
                  title: "Confirm Password",
                  value: lrController.confirmPassRegisTF,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      lrController.register();
                    },
                    child: const Text("Register")),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    InkWell(
                      onTap: () => Get.to(LoginView()),
                      child: Text(
                        "Login",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: CustomColor.mainGreen,
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
