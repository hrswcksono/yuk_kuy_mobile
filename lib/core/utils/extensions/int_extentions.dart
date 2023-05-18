import 'dart:math';

import 'package:intl/intl.dart';
import 'package:yuk_kuy_mobile/core/values/strings.dart';

extension IntExtensions on int {
  String get intToMonth => Strings.listMonth[this - 1];

  String get toPrice => "IDR. ${this ~/ pow(10, 6)}jt/pax";

  String get toRupiah {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR. ',
      decimalDigits: 0,
    );
    return currencyFormatter.format(this);
  }
}
