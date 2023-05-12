import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';
import 'package:yuk_kuy_mobile/core/values/consts.dart';

import '../../../../core/themes/colors.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx((data) => Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      Consts.urlImg +
                          data!.data!.imageProducts![0].src.toString(),
                      height: 345,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: GetBuilder<DetailProductController>(
                          init: DetailProductController(),
                          builder: (context) {
                            return InkWell(
                              onTap: () => context.changeFavorite(data.data!),
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
                      SizedBox(
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
                      SizedBox(
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
                            data.data!.price.toString(),
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(143, 149, 158, 1))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(245, 246, 250, 1),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                matchTextDirection: true,
                                repeat: ImageRepeat.noRepeat,
                                image:
                                    AssetImage("assets/images/image_trip.jpg"),
                              ),
                            ),
                          ),
                          SizedBox(
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
                      SizedBox(
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
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
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
          bottomNavigationBar: ElevatedButton(
            onPressed: () {
              Get.toNamed(AppPages.INITIAL_P, arguments: {"data": data.data});
            },
            child: Text("Book Now"),
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
          ),
        ));
  }
}
