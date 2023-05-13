import 'package:yuk_kuy_mobile/app/data/providers/base_provider.dart';

import '../models/order_model.dart';

class OrderProvider extends BaseProvider {
  Future<OrderModel> listOrder() async {
    var response = await get('orders/mobile');

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return orderModelFromJson(response.bodyString.toString());
    }
  }

  Future<dynamic> addOder(String name, String phone, String email,
      int totalPrice, int totalPackage, int productId) async {
    Map<String, dynamic> jsonBody = {
      'totalPackage': totalPackage,
      'totalPrice': totalPrice,
      'name': name,
      'phone': phone,
      'email': email,
      'productId': productId
    };

    var response = await post(
      'orders/add',
      jsonBody,
      contentType: "application/x-www-form-urlencoded",
    );

    return response.body.toString();
  }
}
