import 'dart:developer';
import 'dart:io';

import 'package:art_sweetalert/art_sweetalert.dart';
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
import 'package:yuk_kuy_mobile/app/data/providers/profile_provider.dart';
import 'package:yuk_kuy_mobile/app/modules/base/controllers/base_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_information_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:yuk_kuy_mobile/app/widgets/custom_alert.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';
import 'package:yuk_kuy_mobile/core/utils/helpers.dart';

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
  var profilProvider = Get.put(ProfileProvider());
  var baseController = Get.put(BaseController());
  var transController = Get.put(TransactionController());

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

  var closeKeyBoard = FocusNode();

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
    getProfile(readUsername());
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

  void showDialogSelect(context) {
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
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Select",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                        )),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: const CloseButton()))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                var pickImage = await _picker.pickImage(
                                    maxHeight: 500,
                                    source: ImageSource.gallery);
                                if (pickImage != null) {
                                  imgVerification = File(pickImage.path);
                                }
                                update();
                                Navigator.pop(context);
                              },
                              child: Text("Gallery",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ))),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                var pickImage = await _picker.pickImage(
                                    maxHeight: 500, source: ImageSource.camera);
                                if (pickImage != null) {
                                  imgVerification = File(pickImage.path);
                                }
                                update();
                                Navigator.pop(context);
                              },
                              child: Text("Camera",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ))),
                            ),
                          ),
                        )
                      ],
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
    try {
      if (name.text == "") {
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.warning,
                title: "Warning",
                text: "Name cannot be empty"));
      } else if (phone.text == "") {
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.warning,
                title: "Warning",
                text: "Phone cannot be empty"));
      } else if (email.text == "") {
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.warning,
                title: "Warning",
                text: "Email cannot be empty"));
      } else if (!email.text.isValidEmail) {
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.warning,
                title: "Warning",
                text: "Invalid email address"));
      } else {
        orderProvider
            .addOder(name.text, phone.text, email.text, totalPrice, numPeople,
                productId)
            .then((value) {
          CustomAlert.success(Get.context!, "Order");
          Get.close(2);
          Get.off(PaymentInformationView(value.data!.id, idTour, true));
        }).onError((error, stackTrace) {
          if (kDebugMode) {
            print(error);
          }
        }).whenComplete(() {
          log("Add Order complete!");
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void detailOrder(int orderId, int sellerId) {
    idOrder = orderId;
    idAccount = sellerId;
    try {
      orderProvider.detailOrder(idOrder).then((value) {
        listBank(sellerId, value);
      }).onError((error, stackTrace) {
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

  void getProfile(username) {
    try {
      profilProvider.detailProfile(username).then((value) {
        name.text = value.data!.name!;
        phone.text = value.data!.profile!.phone;
        email.text = value.data!.email!;
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Detail Profile complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void listBank(int id, OrderDetailModel dataOrder) {
    try {
      bankProvider.listBank(id).then((value) {
        change(Tuple2(dataOrder, value), status: RxStatus.success());
      }).onError((error, stackTrace) {
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
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success,
                title: "Success",
                text: "Send verification successfully"));
        Future.delayed(const Duration(seconds: 2), () {
          nameBankSelected = "Choose Bank :";
          Get.close(1);
          Get.back();
          Get.back();
          Get.back();
          transController.changeState(0);
        });
      }).onError((error, stackTrace) {
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.warning,
                title: "Failed",
                text: error.toString()));
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
        ArtSweetAlert.show(
            context: Get.context!,
            artDialogArgs: ArtDialogArgs(
                type: ArtSweetAlertType.success,
                title: "Success",
                text: "Order Cancel"));
        Future.delayed(const Duration(seconds: 2), () {
          closeKeyBoard.unfocus();
          Get.close(1);
          Get.back();
          Get.back();
          transController.changeState(0);
          update();
        });
      }).onError((error, stackTrace) {
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
    reason = TextEditingController();
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
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Reason",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                        )),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: const CloseButton()))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: reason,
                      focusNode: closeKeyBoard,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (reason.text != "") {
                          cancelOrder(idOrder);
                        } else {
                          ArtSweetAlert.show(
                              context: Get.context!,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.warning,
                                  title: "Cancel Verification",
                                  text: "Reason cannot be empty"));
                        }
                      },
                      child: Text("Submit",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ))),
                    ),
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
