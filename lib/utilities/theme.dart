import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';

final ThemeData theme = ThemeData(
  primarySwatch: Colors.red,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: white,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
    headline2: TextStyle(
      color: white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline3: TextStyle(
      color: white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    headline4: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: black,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: labelGrey,
    ),
    bodyText1: TextStyle(
      color: black,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
    subtitle1: TextStyle(
      color: black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    subtitle2: TextStyle(
      color: white,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  ),
);
