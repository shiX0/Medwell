import 'package:flutter/material.dart';
class Pallete{
  static const Color backgroundColor = Colors.white;
  static const Color primary = Color(0xFFFFBDBD);
  static const Color highlight =Color(0xFF7173A7);
  static const Color accent = Color(0xFFEFF9F8);
  static const Color btnAccent = Color(0xFFE6E6E6);
  static const Color btnSecondary = Color(0xFF9B9B9B);


  //material color for swatch
  static const MaterialColor primarySwatch = MaterialColor(_primarySwatchPrimaryValue, <int, Color>{
    50: Color(0xFFFFF7F7),
    100: Color(0xFFFFEBEB),
    200: Color(0xFFFFDEDE),
    300: Color(0xFFFFD1D1),
    400: Color(0xFFFFC7C7),
    500: Color(_primarySwatchPrimaryValue),
    600: Color(0xFFFFB7B7),
    700: Color(0xFFFFAEAE),
    800: Color(0xFFFFA6A6),
    900: Color(0xFFFF9898),
  });
  static const int _primarySwatchPrimaryValue = 0xFFFFBDBD;
}