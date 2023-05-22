import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/data/providers/base_provider.dart';
import 'package:yuk_kuy_mobile/core/themes/colors.dart';

import 'app/routes/app_pages.dart';
import 'services/storage_services.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Get.lazyPut(() => StorageService());
  await initialConfig();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.initialLR,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            errorMaxLines: 1,
            // iconColor: CustomColor.disable,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color.fromRGBO(245, 246, 250, 1),
            hintStyle: GoogleFonts.inter(
              fontSize: 15,
              color: const Color.fromRGBO(143, 149, 158, 1),
            ),
            // errorStyle: CustomFonts.poppinsRegular12.copyWith(
            //   color: CustomColor.red,
            // ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                48,
              ),
              elevation: 0,
              textStyle: GoogleFonts.inter(),
              backgroundColor: CustomColor.mainGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )),
    );
  }
}

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
  Get.lazyPut<BaseProvider>(() => BaseProvider());
}
