import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/login_register/controllers/login_register_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/login_register/views/components/login_daftar_text_field.dart';
import 'package:yuk_kuy_mobile/app/modules/login_register/views/register_view.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';
import 'package:yuk_kuy_mobile/app/widgets/text_field_global.dart';

import '../../../../core/themes/colors.dart';

class LoginView extends GetView {
  LoginView({Key? key}) : super(key: key);

  var controllerLR = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
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
                  height: 140,
                ),
                Image.asset(
                  'assets/images/logo_yukkuy.png',
                  height: 40,
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFieldGlobal(
                  title: "Email",
                  value: controllerLR.emailLoginTF,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Password",
                  value: controllerLR.passwordLoginTF,
                  obsTxt: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      controllerLR.login();
                    },
                    child: const Text("Login")),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    InkWell(
                      onTap: () => Get.to(RegisterView()),
                      child: Text(
                        "Register",
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
