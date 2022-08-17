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
    labelMedium: TextStyle(
      color: labelGrey,
      fontWeight: FontWeight.w500,
      fontSize: 16,
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
  ),
);
