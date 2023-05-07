import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/themes/colors.dart';
import '../controllers/home_controller.dart';
import 'components/item_grid_home.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                          textStyle: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Welcome to YukKuy.",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(143, 149, 158, 1))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.77,
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Search...",
                            ),
                          ),
                        ),
                        Container(
                          height: 47,
                          width: 46,
                          decoration: BoxDecoration(
                            color: CustomColor.mainGreen,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return const SizedBox(
                        width: 20,
                      );
                    } else {
                      return const SizedBox(
                        width: 5,
                      );
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) => Chip(
                    label: Text(
                      'Surabaya',
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    backgroundColor: const Color.fromRGBO(245, 246, 250, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 5,
                ),
                child: Text(
                  "Product",
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 25,
                  children: List.generate(
                    10,
                    (index) => ItemGridHome(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
