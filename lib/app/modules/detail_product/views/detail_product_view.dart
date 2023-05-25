import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/favorite_model.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/int_extentions.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';
import 'package:yuk_kuy_mobile/core/values/consts.dart';

import '../../../../core/themes/colors.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      child: controller.obx(
        (data) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        Consts.urlImg +
                            data!.data!.imageProducts![0].src.toString(),
                        height: 345,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 15,
                        right: 15,
                        child: GetBuilder<DetailProductController>(
                            init: DetailProductController(),
                            builder: (context) {
                              return InkWell(
                                onTap: () {
                                  final model = FavoriteModel(
                                      id: data.data!.id!,
                                      name: data.data!.name.toString(),
                                      price: data.data!.price!,
                                      dateStart: data.data!.dateStart!
                                          .toIso8601String(),
                                      dateEnd:
                                          data.data!.dateEnd!.toIso8601String(),
                                      image: data.data!.imageProducts![0].src
                                          .toString());
                                  context.changeFavorite(model);
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(245, 246, 250, 1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: context.isFavorite == false
                                        ? const Icon(Icons.favorite_border)
                                        : const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )),
                              );
                            }),
                      ),
                      Positioned(
                        top: 15,
                        left: 15,
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(245, 246, 250, 1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                // size: 16.35,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          data.data!.name.toString(),
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${data.data!.dateStart!.toIso8601String().toFormatedDate} - ${data.data!.dateEnd!.toIso8601String().toFormatedDate}",
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(143, 149, 158, 1))),
                            ),
                            Text(
                              "${data.data!.price!.toRupiah}/pax",
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(143, 149, 158, 1))),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(AppPages.initialSP,
                              arguments: {
                                "data": data.data!.seller!.username.toString()
                              }),
                          child: Row(
                            children: [
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(245, 246, 250, 1),
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    matchTextDirection: true,
                                    repeat: ImageRepeat.noRepeat,
                                    image: AssetImage(
                                        "assets/images/image_trip.jpg"),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                data.data!.seller!.name.toString(),
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Description",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.data!.description.toString(),
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(143, 149, 158, 1))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: ElevatedButton(
            onPressed: () {
              Get.toNamed(AppPages.initialP, arguments: {"data": data.data});
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                60,
              ),
              elevation: 0,
              textStyle: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: CustomColor.mainGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: const Text("Book Now"),
          ),
        ),
        onError: (_) => Container(
          color: Colors.white,
          height: Get.height,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/lotties/error.json',
                    width: 200, height: 200, fit: BoxFit.cover),
                Material(
                  child: InkWell(
                    onTap: () => controller.onRefresh(),
                    child: Text(
                      'Refresh',
                      style: GoogleFonts.inter(
                          fontSize: 30, color: Colors.black26),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
