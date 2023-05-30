import 'package:yuk_kuy_mobile/app/data/providers/base_provider.dart';

import '../models/add_order_model.dart';
import '../models/order_detail_model.dart';
import '../models/order_model.dart';

class OrderProvider extends BaseProvider {
  Future<OrderModel> listOrder(int page, int limit) async {
    var response = await get('orders/mobile?page=$page&limit=$limit');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return orderModelFromJson(response.bodyString.toString());
    }
  }

  Future<OrderModel> filterOrder(String status, int page, int limit) async {
    var response =
        await get('orders/mobile?status=$status&page=$page&limit=$limit');
    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return orderModelFromJson(response.bodyString.toString());
    }
  }

  Future<OrderDetailModel> detailOrder(String id) async {
    var response = await get('orders/$id');
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

  Future<dynamic> verification(int id) async {
    var response = await get('orders/$id');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return orderDetailModelFromJson(response.bodyString.toString());
    }
  }
}
