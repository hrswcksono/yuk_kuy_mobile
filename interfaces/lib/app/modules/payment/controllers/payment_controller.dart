import 'dart:developer';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/order_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/order_provider.dart';
import 'package:yuk_kuy_mobile/app/data/providers/profile_provider.dart';
import 'package:yuk_kuy_mobile/app/modules/base/controllers/base_controller.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/views/payment_information_view.dart';
import 'package:yuk_kuy_mobile/app/modules/transaction/controllers/transaction_controller.dart';
import 'package:yuk_kuy_mobile/app/widgets/custom_alert.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';
import 'package:yuk_kuy_mobile/core/utils/helpers.dart';

class PaymentController extends GetxController
    with StateMixin<OrderDetailModel> {
  dynamic argumentData = Get.arguments;
  String title = "";
  int price = 0, numPeople = 1;
  int totalPrice = 0;
  var orderProvider = Get.put(OrderProvider());
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

  int productId = 0;
  int idTour = 0;

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

  void reducePeople() {
    if (numPeople > 1) {
      numPeople--;
      totalPrice = totalPrice - price;
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
          Get.off(PaymentInformationView(value.data!.redirectUrl));
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
}
