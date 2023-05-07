import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/text_field_global.dart';

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
                  title: "Password",
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldGlobal(
                  title: "Confirm Password",
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {}, child: Text("Register"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
