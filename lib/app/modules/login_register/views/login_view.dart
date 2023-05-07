import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/widgets/text_field_global.dart';

class LoginView extends GetView {
  const LoginView({Key? key}) : super(key: key);
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
                SizedBox(
                  height: 20,
                ),
                TextFieldGlobal(
                  title: "Email",
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldGlobal(
                  title: "Password",
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
