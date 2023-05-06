import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            errorMaxLines: 1,
            // iconColor: CustomColor.disable,
            filled: true,
            fillColor: Color.fromRGBO(245, 246, 250, 1),
            // hintStyle: CustomFonts.poppinsRegular12.copyWith(
            //   color: CustomColor.disable,
            // ),
            // errorStyle: CustomFonts.poppinsRegular12.copyWith(
            //   color: CustomColor.red,
            // ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   borderSide: BorderSide(
            //     width: 1,
            //     // color: CustomColor.disable,
            //   ),
            // ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   borderSide: BorderSide(
            //     width: 1,
            //     // color: CustomColor.disable,
            //   ),
            // ),
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   borderSide: BorderSide(
            //     width: 1,
            //     // color: CustomColor.red,
            //   ),
            // ),
            ),
      ),
    ),
  );
}
