import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Constants {
  static Color backgroundColor = HexColor('#FFFFFF');

  static Color mainColor = HexColor('#2651EB');
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
