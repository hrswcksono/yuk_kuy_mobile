import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_model.dart';

import '../models/city_model.dart';
import 'base_provider.dart';

class ProductProvider extends BaseProvider {
  Future<CityModel> listCity() async {
    var response = await get('products/city');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return cityModelFromJson(response.bodyString.toString());
    }
  }

  Future<ProductModel> listProduct() async {
    var response = await get('products/mobile');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return productModelFromJson(response.bodyString.toString());
    }
  }

  Future<ProductModel> listProductPagination(int page, int numPerPage) async {
    var response = await get('products/mobile?page=$page&limit=$numPerPage');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return productModelFromJson(response.bodyString.toString());
    }
  }

  Future<ProductModel> filterProduct(
      String name, int page, int numPerPage) async {
    var response =
        await get('products/mobile?city=$name&$page&limit=$numPerPage');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return productModelFromJson(response.bodyString.toString());
    }
  }

  Future<ProductModel> searchProduct(
      String name, int page, int numPerPage) async {
    var response =
        await get('products/search?key=$name&$page&limit=$numPerPage');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return productModelFromJson(response.bodyString.toString());
    }
  }

  Future<ProductDetailModel> detailProduct(int id) async {
    var response = await get('products/mobile/detail/$id');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return productDetailModelFromJson(response.bodyString.toString());
    }
  }
}
