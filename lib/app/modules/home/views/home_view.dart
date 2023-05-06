import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                TextField(),
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
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Text('Home'), label: ""),
        BottomNavigationBarItem(icon: Text('Transaction'), label: ""),
        BottomNavigationBarItem(icon: Text('Favorite'), label: ""),
        BottomNavigationBarItem(icon: Text('Profile'), label: ""),
      ]),
      // bottomNavigationBar: Container(
      //   color: Colors.amber,
      //   height: 64,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Text(
      //         'Home',
      //         style: GoogleFonts.inter(
      //             textStyle: TextStyle(color: Color.fromRGBO(25, 164, 99, 1))),
      //       ),
      //       Text(
      //         'Transaction',
      //         style: GoogleFonts.inter(
      //             textStyle: TextStyle(color: Color.fromRGBO(25, 164, 99, 1))),
      //       ),
      //       Text(
      //         'Favorite',
      //         style: GoogleFonts.inter(
      //             textStyle: TextStyle(color: Color.fromRGBO(25, 164, 99, 1))),
      //       ),
      //       Text(
      //         'Profile',
      //         style: GoogleFonts.inter(
      //             textStyle: TextStyle(color: Color.fromRGBO(25, 164, 99, 1))),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
