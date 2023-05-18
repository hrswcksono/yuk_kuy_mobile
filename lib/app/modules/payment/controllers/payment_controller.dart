import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tuple/tuple.dart';
import 'package:yuk_kuy_mobile/app/data/models/bank_model.dart';
import 'package:yuk_kuy_mobile/app/data/models/order_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/bank_provider.dart';
import 'package:yuk_kuy_mobile/app/data/providers/order_provider.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_information_view.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_verification_view.dart';
import 'package:yuk_kuy_mobile/app/widgets/custom_alert.dart';

import '../../../data/providers/verification_provider.dart';

class PaymentController extends GetxController
    with StateMixin<Tuple2<OrderDetailModel, BankModel>> {
  dynamic argumentData = Get.arguments;
  String title = "";
  int price = 0, numPeople = 1;
  int totalPrice = 0;
  var orderProvider = Get.put(OrderProvider());
  var bankProvider = Get.put(BankProvider());
  var verifProvider = Get.put(VerificationProvider());

  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;

  int idOrder = 0;
  int idAccount = 0;

  bool showListBank = false;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;

  final ImagePicker _picker = ImagePicker();
  File? imgVerification;

  String nameBankSelected = "Choose Bank :";

  int idBank = 0;
  int productId = 0;
  int idTour = 0;

  late TextEditingController reason;

  @override
  void onInit() {
    super.onInit();
  }

  void initData(ProductDetailItem data) {
    numPeople = 1;
    name = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    title = data.name.toString();
    price = data.price!;
    totalPrice = price;
    productId = data.id!;
    idTour = data.accountId!;
  }

  void addPeople() {
    numPeople++;
    totalPrice = totalPrice + price;
    update();
  }

  void initVerification() {
    imgVerification = null;
    showListBank = false;
    // update();
  }

  void initPaymentVerification() {
    reason = TextEditingController();
  }

  void reducePeople() {
    if (numPeople > 1) {
      numPeople--;
      totalPrice = totalPrice - price;
      update();
    }
  }

  void stateListBank() {
    showListBank = !showListBank;
    update();
  }

  addImage(String label) async {
    if (label == "Gallery") {
      var pickImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        imgVerification = File(pickImage.path);
      }
      update();
    } else if (label == "Camera") {
      var pickImage = await _picker.pickImage(source: ImageSource.camera);
      if (pickImage != null) {
        imgVerification = File(pickImage.path);
      }
      update();
    }
  }

  void addOrder() {
    print("name : ${name.text}");
    print("phone : ${phone.text}");
    print("email : ${email.text}");
    print("totalPrice : ${totalPrice}");
    print("numpeople : ${numPeople}");
    print("argumen : ${argumentData["data"].id}");
    try {
      orderProvider
          .addOder(name.text, phone.text, email.text, totalPrice, numPeople,
              productId)
          .then((value) {
        CustomAlert.success(Get.context!, "Order");
        Get.off(PaymentInformationView(productId, idTour));
        print("berhasil");
        print(value);
      }).onError((error, stackTrace) {
        print('error');
        // change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Add Order complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void detailOrder(int id, int accountId) {
    idOrder = id;
    idAccount = accountId;
    try {
      orderProvider.detailOrder(idOrder).then((value) {
        listBank(accountId, value);
        print("berhasil");
        print(value);
      }).onError((error, stackTrace) {
        print('error');
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Detail Order complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void listBank(int id, OrderDetailModel data) {
    print('account id : $id');
    try {
      bankProvider.listBank(id).then((value) {
        print(value.toString());
        change(Tuple2(data, value), status: RxStatus.success());
      }).onError((error, stackTrace) {
        print('error');
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Bank Order complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void verifOrder(int idOrd) {
    try {
      verifProvider.verifOrder(imgVerification!, idBank, idOrd).then((value) {
        print(value);
      }).onError((error, stackTrace) {
        print('error');
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Verif complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void cancelOrder(int idOrd) {
    try {
      verifProvider.cancelOrder(idOrd, reason.text).then((value) {
        print(value);
      }).onError((error, stackTrace) {
        print('error');
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Verif complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void onRefresh() async {
    isLoading = false;
    update();
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000), () {
      detailOrder(idOrder, idAccount);
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }

  void showDialogCancel() {
    Get.dialog(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 150),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      width: 180,
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Text(
                      "Reason for Cancel",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: reason,
                    ),
                    const SizedBox(height: 20),
                    //Buttons
                    ElevatedButton(
                      onPressed: () {
                        if (reason.text != "") {
                          cancelOrder(idOrder);
                        }
                      },
                      child: Text("Cancel",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
