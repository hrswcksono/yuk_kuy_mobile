import 'dart:io';

import 'package:get/get.dart';

import 'base_provider.dart';

class VerificationProvider extends BaseProvider {
  Future<dynamic> verifOrder(File imageReceipt, int bankId, int orderId) async {
    var imageFile = MultipartFile(
      imageReceipt,
      filename: "test.png",
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

    return response.body.toString();
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

    print(response.body.toString());

    return response.body.toString();
  }
}
