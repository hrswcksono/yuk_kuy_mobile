import 'package:yuk_kuy_mobile/core/utils/extensions/int_extentions.dart';

extension StringExtension on String {
  String get toFormatedDate =>
      "${substring(8, 10)} ${int.parse(substring(5, 7)).intToMonth} ${substring(0, 4)}";
}

extension EmailValidator on String {
  bool get isValidEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this);
}
