import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/themes/colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: GoogleFonts.inter(
                      textStyle:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                ),
                Text(
                  "Welcome to YukKuy.",
                  style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(143, 149, 158, 1))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.77,
                      child: TextField(),
                    ),
                    Container(
                      height: 47,
                      width: 46,
                      decoration: BoxDecoration(
                        color: CustomColor.mainGreen,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) => Chip(
                      label: Text(
                        'Surabaya',
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
