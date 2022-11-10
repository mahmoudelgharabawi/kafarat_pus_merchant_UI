import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Baloo',
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.grey.shade300,
  iconTheme: IconThemeData(
    color: Constants.mainColor,
  ),
  appBarTheme: AppBarTheme(color: Constants.mainColor),
  primaryColor: Constants.mainColor,
  primarySwatch: Constants.mainColor,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Constants.mainColor,
    iconTheme: MaterialStateProperty.all(IconThemeData(
      color: Colors.white,
    )),
  ),
  // textTheme: TextTheme(
  //   subtitle1: TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: 'Tajawal',
  //       color: Colors.deepPurple),
  //   bodyText1: TextStyle(
  //       fontSize: 16,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: 'Tajawal',
  //       color: Colors.deepPurple),
  // ),
  inputDecorationTheme: InputDecorationTheme(
    errorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(30),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide:
          BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.none),
    ),
    filled: true,
    // fillColor: Colors.white,
    border: const UnderlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  ),
);
