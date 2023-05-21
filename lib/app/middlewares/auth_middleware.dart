import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/helpers.dart';
import '../routes/app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (readToken().isNotEmpty) {
      return const RouteSettings(name: Routes.base);
    }
    return null;
  }
}
