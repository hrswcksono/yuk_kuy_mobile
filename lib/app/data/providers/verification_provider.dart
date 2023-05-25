import 'dart:io';

import 'package:get/get.dart';

import 'base_provider.dart';
import 'package:path/path.dart';

class VerificationProvider extends BaseProvider {
  Future<dynamic> verifOrder(File imageReceipt, int bankId, int orderId) async {
    print(basename(imageReceipt.path));

    var imageFile = MultipartFile(
      imageReceipt,
      filename: basename(imageReceipt.path),
      contentType: "multipart/form-data",
    );

    var body = FormData({
      'bankId': bankId,
      'orderId': orderId,
      'imageReceipt': imageFile,
    });

    var response = await post(
      'orders/verifications/add',
      body,
    );

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return response.body.toString();
    }
  }

  Future<dynamic> cancelOrder(int orderId, String reason) async {
    Map<String, String> jsonBody = {
      'reason': reason,
    };

    var response = await put(
      'orders/cancel/$orderId',
      jsonBody,
      contentType: "application/x-www-form-urlencoded",
    );

    return response.body.toString();
  }
}
