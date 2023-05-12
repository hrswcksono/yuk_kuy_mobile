import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_model.dart';

import 'base_provider.dart';

class ProductProvider extends BaseProvider {
  Future<ProductModel> list_product() async {
    var response = await get('products/mobile');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return productModelFromJson(response.bodyString.toString());
    }
  }

  Future<ProductDetailModel> detail_product(int id) async {
    var response = await get('products/mobile/detail/$id');

    if (!response.body['status']) {
      return Future.error(response.body["message"]);
    } else {
      return productDetailModelFromJson(response.bodyString.toString());
    }
  }
}
