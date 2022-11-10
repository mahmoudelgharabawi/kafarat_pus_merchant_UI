import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Constants {
  static Map<int, Color> color = {
    50: Color.fromRGBO(38, 81, 235, .1),
    100: Color.fromRGBO(38, 81, 235, .2),
    200: Color.fromRGBO(38, 81, 235, .3),
    300: Color.fromRGBO(38, 81, 235, .4),
    400: Color.fromRGBO(38, 81, 235, .5),
    500: Color.fromRGBO(38, 81, 235, .6),
    600: Color.fromRGBO(38, 81, 235, .7),
    700: Color.fromRGBO(38, 81, 235, .8),
    800: Color.fromRGBO(38, 81, 235, .9),
    900: Color.fromRGBO(38, 81, 235, 1),
  };
  static Color backgroundColor = HexColor('#FFFFFF');

  static MaterialColor mainColor = MaterialColor(0xff2651EB, color);
  static Color fontColor = HexColor('#141414');

  static InputDecoration textFieldDecoration = InputDecoration(
    errorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(5),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide:
      BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.none),
    ),
    filled: true,
    fillColor: Colors.white,

    border: const UnderlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    // suffixIcon: const Icon(Icons.lock),
  );

  static double textFieldCircularRaduis = 4;
}
