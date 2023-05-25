import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie_player/lottie_player.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/utils/helpers.dart';
import '../controllers/home_controller.dart';
import 'components/item_grid_home.dart';

// ignore: must_be_immutable
class HomeView extends GetView {
  HomeView({Key? key}) : super(key: key);

  var homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SmartRefresher(
          controller: homeC.refreshController,
          onRefresh: homeC.onRefresh,
          child: ListView(
            controller: homeC.scroll,
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
                      readUsername(),
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Welcome to YukKuy.",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(143, 149, 158, 1))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.77,
                          child: TextField(
                            controller: homeC.search,
                            decoration: const InputDecoration(
                              hintText: "Search...",
                            ),
                            onSubmitted: (_) {
                              homeC.search;
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            homeC.resetList();
                            homeC.stateData = 3;
                            homeC.searchProduct();
                          },
                          child: Container(
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
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (ctx) => SizedBox(
                        height: 40,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: homeC.toFilterList().length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0 ||
                                index == (homeC.toFilterList().length)) {
                              return const SizedBox(
                                width: 20,
                              );
                            } else {
                              return const SizedBox(
                                width: 5,
                              );
                            }
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              itemFilterHome(
                            homeC.toFilterList()[index],
                            index,
                            ctx.stateFilterHome[index],
                            ctx,
                          ),
                        ),
                      )),
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
              homeC.obx(
                (data) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 25,
                      children: List.generate(
                        data!.length,
                        (index) => ItemGridHome(model: data[index]),
                      ),
                    ),
                  );
                },
                onLoading: SizedBox(
                    height: Get.height * 0.6,
                    child: const Center(child: CircularProgressIndicator())),
                onEmpty: SizedBox(
                  height: Get.height * 0.8,
                  width: Get.width,
                  child: const LottiePlayer(
                    networkUrl:
                        'https://assets10.lottiefiles.com/packages/lf20_NeuXI2OPLG.json',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (context) {
                    return context.loadingPagination
                        ? const SizedBox(child: LinearProgressIndicator())
                        : const SizedBox(
                            height: 20,
                          );
                  }),
            ],
          ),
        ),
      ),
      // floatingActionButton: ,
    );
  }

  ActionChip itemFilterHome(
      String data, int index, bool state, HomeController ctx) {
    return ActionChip(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      label: Text(
        data,
        style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: state ? Colors.white : Colors.black)),
      ),
      backgroundColor: state
          ? CustomColor.mainGreen
          : const Color.fromRGBO(245, 246, 250, 1),
      // backgroundColor: Colors.white,
      onPressed: () {
        ctx.changeState(index, data);
      },
    );
  }
}
