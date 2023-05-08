import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/modules/login_register/views/components/login_daftar_text_field.dart';

class RegisterView extends GetView {
  const RegisterView({Key? key}) : super(key: key);
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
                  height: 20,
                ),
                const LoginDaftarTextField(
                  title: "Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                const LoginDaftarTextField(
                  title: "Username",
                ),
                const SizedBox(
                  height: 10,
                ),
                const LoginDaftarTextField(
                  title: "Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                const LoginDaftarTextField(
                  title: "Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                const LoginDaftarTextField(
                  title: "Confirm Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
