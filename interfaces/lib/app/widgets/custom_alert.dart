import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

class CustomAlert {
  static void success(BuildContext context, String title) {
    ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "Success",
            text: "$title Success"));
  }
}
