import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'services/storage_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(() => StorageService());
  await initialConfig();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL_B,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
            errorMaxLines: 1,
            // iconColor: CustomColor.disable,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Color.fromRGBO(245, 246, 250, 1)),
            ),
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
    );
  }
}

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
}
