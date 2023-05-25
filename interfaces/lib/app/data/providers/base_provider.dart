import 'package:get/get.dart';

import '../../../core/utils/helpers.dart';
import '../../../core/values/consts.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Consts.baseUrl;

    var token = readToken();

    httpClient.addRequestModifier<void>((request) {
      // request.headers['Accept'] = 'application/json';
      request.headers['access_token'] = token;
      return request;
    });

    super.onInit();
  }
}
