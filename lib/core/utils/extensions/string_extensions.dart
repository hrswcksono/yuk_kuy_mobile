import 'package:yuk_kuy_mobile/core/utils/extensions/int_extentions.dart';

extension StringExtension on String {
  String get toFormatedDate =>
      "${substring(8, 10)} ${int.parse(substring(5, 7)).intToMonth} ${substring(0, 4)}";
}
