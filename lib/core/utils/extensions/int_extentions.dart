import 'package:yuk_kuy_mobile/core/values/strings.dart';

extension IntExtensions on int {
  String get intToMonth => Strings.listMonth[this - 1];
}
