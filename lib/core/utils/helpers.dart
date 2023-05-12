import 'package:get_storage/get_storage.dart';
import 'package:yuk_kuy_mobile/app/data/models/product_detail_model.dart';

import '../values/keys/get_storage_key.dart';

String readToken() {
  var result = GetStorage().read(GetStorageKey.userToken);
  return (result != null) ? result : "";
}

void removeToken() {
  GetStorage().remove(GetStorageKey.userToken);
  GetStorage().remove(GetStorageKey.userName);
}

String readUsername() {
  var result = GetStorage().read(GetStorageKey.userName);
  return (result != null) ? result : "";
}

List<ProductDetailItem> readListFavorite() {
  var result = GetStorage().read(GetStorageKey.listFavorite);
  return (result != null) ? result : [];
}

void removefavorite() {
  GetStorage().remove(GetStorageKey.listFavorite);
}
