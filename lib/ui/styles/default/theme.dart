import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';

final primaryThemeData = ThemeData(
  scaffoldBackgroundColor: const Color(primaryBackgroundColor),
  textTheme: const TextTheme(

    headline3: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.31,
      color: Color(primaryBlackColor),
      package: 'food_ninja'
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.81,
      color: Color(primaryBlackColor),
      package: 'food_ninja'
    ),
  ),

  primaryTextTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 16,
      color: Colors.white,
      package: 'food_ninja'
    ),
  ),
  fontFamily: 'BentonSans',
);