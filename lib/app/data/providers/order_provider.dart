import 'package:yuk_kuy_mobile/app/data/providers/base_provider.dart';

import '../models/add_order_model.dart';
import '../models/order_detail_model.dart';
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

  Future<OrderModel> filterOrder(String status) async {
    var response = await get('orders/mobile?status=$status');

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return orderModelFromJson(response.bodyString.toString());
    }
  }

  Future<OrderDetailModel> detailOrder(int id) async {
    var response = await get('orders/$id');

    print(response.body.toString());

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return orderDetailModelFromJson(response.bodyString.toString());
    }
  }

  Future<AddOrderModel> addOder(String name, String phone, String email,
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

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return addOrderModelFromJson(response.bodyString.toString());
    }
  }
}
