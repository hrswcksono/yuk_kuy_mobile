import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/modules/favorite/views/favorite_view.dart';
import 'package:yuk_kuy_mobile/app/modules/home/views/home_view.dart';
import 'package:yuk_kuy_mobile/app/modules/profile/views/profile_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/views/transaction_view.dart';

import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
        init: BaseController(),
        builder: (bcontroller) {
          return Scaffold(
            body: DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text("Tekan sekali lagi untuk keluar"),
              ),
              child: IndexedStack(
                index: bcontroller.indexTab,
                children: [
                  HomeView(),
                  TransactionView(),
                  const FavoriteView(),
                  const ProfileView()
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: Get.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => bcontroller.changeIndexTab(0),
                      child: bcontroller.indexTab == 0
                          ? NavBarItem('Home')
                          : NavbarIconItem('assets/icons/ic_home.png', 18),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => bcontroller.changeIndexTab(1),
                      child: bcontroller.indexTab == 1
                          ? NavBarItem('Transaction')
                          : NavbarIconItem(
                              'assets/icons/ic_transaction.png', 18),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => bcontroller.changeIndexTab(2),
                      child: bcontroller.indexTab == 2
                          ? NavBarItem('Favorite')
                          : NavbarIconItem('assets/icons/ic_favorite.png', 18),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => bcontroller.changeIndexTab(3),
                      child: bcontroller.indexTab == 3
                          ? NavBarItem('Profile')
                          : NavbarIconItem('assets/icons/ic_profile.png', 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // ignore: non_constant_identifier_names
  SizedBox NavbarIconItem(String image, double size) {
    return SizedBox(
      height: size,
      child: Image.asset(image),
    );
  }

  // ignore: non_constant_identifier_names
  Center NavBarItem(String title) {
    return Center(
      child: Text(
        title,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
              color: Color.fromRGBO(25, 164, 99, 1),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
