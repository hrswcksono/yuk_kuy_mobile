import 'package:get_storage/get_storage.dart';
import 'package:yuk_kuy_mobile/app/data/models/favorite_model.dart';
import 'package:yuk_kuy_mobile/services/storage_services.dart';

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

void saveListFavorite(FavoriteModel data) {
  var temp = -1;

  var listFavorite = readFavorite();

  temp = listFavorite.indexWhere((element) => element[0] == data.id);

  if (temp == -1) {
    listFavorite.add([
      data.id,
      data.name.toString(),
      data.dateStart.toString(),
      data.dateEnd.toString(),
      data.image.toString(),
      data.price
    ]);

    StorageService().write(GetStorageKey.listFavorite, listFavorite);
  }
}

void deleteFavorite(FavoriteModel data) {
  var temp = -1;
  var listFavorite = readFavorite();

  temp = listFavorite.indexWhere((element) => element[0] == data.id);

  if (temp != -1) {
    listFavorite.removeAt(temp);
    StorageService().write(GetStorageKey.listFavorite, listFavorite);
  }
}

dynamic readFavorite() {
  var result = StorageService().read(GetStorageKey.listFavorite);
  return (result == null) ? [] : result;
}

// void test() {
//   StorageService().write("test", [
//     [
//       4,
//       "hallo 11",
//       "2023-05-05 00:00:00.000Z",
//       "2023-05-15 00:00:00.000Z",
//       "image_trip-1684216736463388.jpg",
//       2000000
//     ],
//     [
//       4,
//       "hallo 11",
//       "2023-05-05 00:00:00.000Z",
//       "2023-05-15 00:00:00.000Z",
//       "image_trip-1684216736463388.jpg",
//       2000000
//     ],
//     [
//       4,
//       "hallo 11",
//       "2023-05-05 00:00:00.000Z",
//       "2023-05-15 00:00:00.000Z",
//       "image_trip-1684216736463388.jpg",
//       2000000
//     ],
//     [
//       4,
//       "hallo 11",
//       "2023-05-05 00:00:00.000Z",
//       "2023-05-15 00:00:00.000Z",
//       "image_trip-1684216736463388.jpg",
//       2000000
//     ]
//   ]);
// }

// dynamic readData() {
//   return GetStorage().read("test");
// }

// void removefavorite() {
//   GetStorage().remove(GetStorageKey.listFavorite);
// }
