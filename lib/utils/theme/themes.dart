import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

const Color pink = Colors.pink;
const Color yellow = Colors.yellow;
const Color ligtprimaryColr = pink;
const Color darkPrimaryColor = Colors.yellow;

class Themes {
  // Theme._();

  static final light = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: Colors.pink,
    // primaryColor: ligtprimaryColr,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.yellow,
    // primaryColor: darkPrimaryColor,
  );


}

TextStyle get subHeadingTextStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 24,
        fontWeight: FontWeight.bold,
      ));
}

TextStyle get titleTextStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 20,
      ));
}

TextStyle get buttonTextStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ));
}


TextStyle get labelTextStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 20,
      ));
}


TextStyle get headingTextStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(fontSize: 24,

  ));
}