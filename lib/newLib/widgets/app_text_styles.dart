import 'package:flutter/material.dart';
import 'package:todo_app/themes/fonts.dart';

class AppTextStyles {
  // Normal font style
  static TextStyle normal({
    double fontSize = 20.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: font,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.normal,
    );
  }

  // Bold font style
  static TextStyle bold({
    double fontSize = 24.0,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: fontBold,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }
}
