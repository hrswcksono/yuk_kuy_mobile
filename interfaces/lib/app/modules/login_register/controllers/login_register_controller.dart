import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/core/utils/extensions/string_extensions.dart';

import '../../../../core/values/keys/get_storage_key.dart';
import '../../../../services/storage_services.dart';
import '../../../data/providers/auth_provider.dart';
import '../../../routes/app_pages.dart';

class LoginRegisterController extends GetxController {
  var authProvider = Get.put(LoginProvider());
  var getService = Get.put(StorageService());

  late TextEditingController emailLoginTF;
  late TextEditingController passwordLoginTF;

  late TextEditingController usernameRegisTF;
  late TextEditingController nameRegisTF;
  late TextEditingController emailRegisTF;
  late TextEditingController passwordRegisTF;
  late TextEditingController confirmPassRegisTF;

  // final count = 0.obs;
  @override
  void onInit() {
    initTextLogin();
    super.onInit();
  }

  void initTextLogin() {
    emailLoginTF = TextEditingController();
    passwordLoginTF = TextEditingController();
  }

  void initTextRegister() {
    usernameRegisTF = TextEditingController();
    nameRegisTF = TextEditingController();
    emailRegisTF = TextEditingController();
    passwordRegisTF = TextEditingController();
    confirmPassRegisTF = TextEditingController();
  }

  void login() {
    if (emailLoginTF.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Email cannot be empty",
        ),
      );
      return;
    }

    if (passwordLoginTF.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Password cannot be empty",
        ),
      );
      return;
    }

    try {
      authProvider
          .login(emailLoginTF.text, passwordLoginTF.text.toString())
          .then((value) {
        getService.write(GetStorageKey.userToken, value.data.accessToken);
        getService.write(GetStorageKey.userName, value.data.username);
        ArtSweetAlert.show(
          context: Get.context!,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Success",
            text: "Login Success",
          ),
        );
        Future.delayed(const Duration(seconds: 2), () {
          Get.back();
          Get.offAllNamed(AppPages.initialB);
        });
      }).onError((error, stackTrace) {
        ArtSweetAlert.show(
          context: Get.context!,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Failed",
            text: error.toString(),
          ),
        );
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void register() {
    if (usernameRegisTF.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Username cannot be empty",
        ),
      );
      return;
    }

    if (usernameRegisTF.text.contains(" ")) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Invalid username format",
        ),
      );
      return;
    }

    if (nameRegisTF.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Name cannot be empty",
        ),
      );
      return;
    }

    if (emailRegisTF.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Email cannot be empty",
        ),
      );
      return;
    }

    if (!emailRegisTF.text.isValidEmail) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Invalid email address",
        ),
      );
      return;
    }

    if (passwordRegisTF.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Password cannot be empty",
        ),
      );
      return;
    }

    if (confirmPassRegisTF.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "Confirm Password cannot be empty",
        ),
      );
      return;
    }

    try {
      authProvider
          .register(
        usernameRegisTF.text,
        nameRegisTF.text,
        emailRegisTF.text,
        passwordRegisTF.text,
        confirmPassRegisTF.text,
      )
          .then((value) {
        ArtSweetAlert.show(
          context: Get.context!,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Success",
            text: "Register Success",
          ),
        );
        Future.delayed(const Duration(seconds: 2), () {
          clearTextRegister();
          Get.back();
          Get.back();
        });
      }).onError((error, stackTrace) {
        ArtSweetAlert.show(
          context: Get.context!,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Failed",
            text: error.toString(),
          ),
        );
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void clearTextRegister() {
    usernameRegisTF.clear();
    nameRegisTF.clear();
    emailRegisTF.clear();
    passwordRegisTF.clear();
    confirmPassRegisTF.clear();
  }
}
