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
    bodyText1: TextStyle(
      color: black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: labelGrey,
    ),
  ),
);
