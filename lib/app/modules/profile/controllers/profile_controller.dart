import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yuk_kuy_mobile/app/data/models/profile_model.dart';
import 'package:yuk_kuy_mobile/app/data/providers/profile_provider.dart';
import 'package:yuk_kuy_mobile/app/routes/app_pages.dart';
import 'package:yuk_kuy_mobile/core/utils/helpers.dart';

import '../../../../services/storage_services.dart';

class ProfileController extends GetxController with StateMixin<ProfileModel> {
  var profileProvider = Get.put(ProfileProvider());
  var getService = Get.put(StorageService());

  //edit profile
  late TextEditingController editName;
  late TextEditingController editUsername;
  late TextEditingController editEmail;
  late TextEditingController editPhone;
  late TextEditingController editAddress;

  //edit password
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initPasswordTF() {
    oldPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
  }

  void initEdit(ProfileItem data) {
    editName = TextEditingController();
    editUsername = TextEditingController();
    editEmail = TextEditingController();
    editPhone = TextEditingController();
    editAddress = TextEditingController();
    editName.text = data.name.toString();
    editUsername.text = data.username.toString();
    editEmail.text = data.email.toString();
    editPhone.text = data.profile!.phone.toString();
    editAddress.text = data.profile!.address.toString();
  }

  void logout() {
    removeToken();
    Get.toNamed(AppPages.INITIAL_LR);
  }

  void initData() {
    try {
      profileProvider.detailProfile(readUsername()).then((value) {
        print(value);
        change(value, status: RxStatus.success());
      }).onError((error, stackTrace) {
        change(null, status: RxStatus.error());
        if (kDebugMode) {
          print(error);
        }
      }).whenComplete(() {
        log("Profile complete!");
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void editData() {
    try {
      profileProvider
          .editProfile(editUsername.text, editName.text, editEmail.text,
              editPhone.text, editAddress.text)
          .then((value) {
            print('berhasil');
            print(value);
            Get.back();
            initData();
          })
          .onError((error, stackTrace) {})
          .whenComplete(() {
            log('selesai edit');
          });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void editPassword() {
    try {
      profileProvider
          .editPassword(
              oldPassword.text, newPassword.text, confirmPassword.text)
          .then((value) {
            print('berhasil');
            print(value);
            Get.back();
            // initData();
          })
          .onError((error, stackTrace) {})
          .whenComplete(() {
            log('selesai edit password');
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
      initData();
      update();
      return refreshController.refreshCompleted();
    });
    // is_Loading = true;
    // if failed,use refreshFailed()
    // update();
  }
}
