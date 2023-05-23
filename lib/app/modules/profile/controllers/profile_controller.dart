import 'dart:developer';
import 'dart:io';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  late TextEditingController editName = TextEditingController(text: '');
  late TextEditingController editUsername = TextEditingController(text: '');
  late TextEditingController editEmail = TextEditingController(text: '');
  late TextEditingController editPhone = TextEditingController(text: '');
  late TextEditingController editAddress = TextEditingController(text: '');

  //edit password
  late TextEditingController oldPassword;
  late TextEditingController newPassword;
  late TextEditingController confirmPassword;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool isLoading = true;

  // image picker
  final ImagePicker _picker = ImagePicker();
  File? imageProduct;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  addImage(String label) async {
    if (label == "Gallery") {
      var pickImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        imageProduct = File(pickImage.path);
      }
      update();
    } else if (label == "Camera") {
      var pickImage = await _picker.pickImage(source: ImageSource.camera);
      if (pickImage != null) {
        imageProduct = File(pickImage.path);
      }
      update();
    }
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

    if (data.profile != null) {
      editPhone.text = data.profile!.phone?.toString() ?? '';
      editAddress.text = data.profile!.address ?? '';
    } else {
      editPhone.text = '';
      editAddress.text = '';
    }
  }

  void logout() async {
    ArtDialogResponse response = await ArtSweetAlert.show(
        barrierDismissible: false,
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
            denyButtonText: "Cancel",
            title: "Are you sure?",
            text: "You want to logout?",
            confirmButtonText: "Logout",
            type: ArtSweetAlertType.warning));

    // ignore: unnecessary_null_comparison
    if (response == null) {
      return;
    }

    if (response.isTapConfirmButton) {
      Future.delayed(const Duration(seconds: 2), () {
        removeToken();
        Get.offNamed(AppPages.initialLR);
        return;
      });
    }
  }

  void initData() {
    try {
      profileProvider.detailProfile(readUsername()).then((value) {
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
      String name = editName.text.isEmpty ? '' : editName.text;
      String username = editUsername.text.isEmpty ? '' : editUsername.text;
      String email = editEmail.text.isEmpty ? '' : editEmail.text;
      String phone = editPhone.text.isEmpty ? '' : editPhone.text;
      String address = editAddress.text.isEmpty ? '' : editAddress.text;

      profileProvider
          .editProfile(username, name, email, phone, address)
          .then((value) {
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
    if (oldPassword.text.isEmpty ||
        newPassword.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      ArtSweetAlert.show(
        context: Get.context!,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: "Error",
          text: "All fields must be filled",
        ),
      );
      return;
    }

    try {
      profileProvider
          .editPassword(
              oldPassword.text, newPassword.text, confirmPassword.text)
          .then((value) {
        Get.back();
        initData();
        ArtSweetAlert.show(
          context: Get.context!,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Success",
            text: "Change password successful",
          ),
        );
      }).catchError((error) {
        ArtSweetAlert.show(
          context: Get.context!,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            title: "Error",
            text: "Old password is incorrect",
          ),
        );
      }).whenComplete(() {
        log('selesai edit password');
      });
    } catch (e) {
      if (kDebugMode) {
        print("gagal");
      }
    }
  }

  void changeAvatar() {
    try {
      profileProvider
          .changeAvatar(imageProduct!)
          .then((value) {
            imageProduct = null;
            update();
            Get.back();
            initData();
          })
          .onError((error, stackTrace) {})
          .whenComplete(() {
            log('selesai change avatar');
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
