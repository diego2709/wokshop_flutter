import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const primaryColorSwatch = MaterialColor(
    0xff3370FF,
    <int, Color>{
      50: Color(0xFFD8E2FE),
      100: Color(0xFFD6E7FF),
      200: Color(0xFFADCDFF),
      300: Color(0xFF84B0FF),
      400: Color(0xFF6698FF),
      500: Color(0xFF3370FF),
      600: Color(0xFF2556DB),
      700: Color(0xFF193FB7),
      800: Color(0xFF102B93),
      900: Color(0xFF091D7A),
    },
  );

  static const secondaryColorSwatch = MaterialColor(
    0xff0B141F,
    <int, Color>{
      50: Color(0xFFF3F4F6),
      100: Color(0xFFF3F4F6),
      200: Color(0xFFACAFC6),
      300: Color(0xFFACAFC6),
      400: Color(0xFF72798B),
      500: Color(0xFF72798B),
      600: Color(0xFF242D3A),
      700: Color(0xFF242D3A),
      800: Color(0xFF0B141F),
      900: Color(0xFF0B141F),
    },
  );

  static const backgroundColor = Color(0xFFF8F9FA);

  static const lightColor = Color(0xffFFFFFF);

  static const blue = Color(0xff3370FF);
  static const green = Color(0xff4bbf28);
  static const yellow = Color(0xffFFAA0C);
  static const red = Color(0xffFF462D);

  static const error = MaterialColor(
    0xff8E2A16,
    <int, Color>{
      50: Color(0xFFD8E2FE),
      100: Color(0xFFFFE7D5),
      200: Color(0xFFFFC9AB),
      300: Color(0xFFFFA481),
      400: Color(0xFFFF8061),
      500: Color(0xffFF462D),
      600: Color(0xFFDB2820),
      700: Color(0xFFB7161D),
      800: Color(0xFF930E1E),
      900: Color(0xFF7A081F),
    },
  );
}
