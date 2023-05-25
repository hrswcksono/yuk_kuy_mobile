import 'package:flutter/material.dart';

extension WidgetExtention on Widget {
  Widget margin({
    double? horizontal,
    double? vertical,
    double? top,
    double? right,
    double? bottom,
    double? left,
    double? all,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
      ),
      child: this,
    );
  }
}
