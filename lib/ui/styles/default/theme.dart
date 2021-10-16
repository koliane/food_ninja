import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';

final primaryThemeData = ThemeData(
  scaffoldBackgroundColor: const Color(primaryBackgroundColor),

  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        height: 1.31,
        color: Color(primaryBlackColor),
        package: 'food_ninja'
    ),
    headline2: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w700,
        height: 1.31,
        color: Color(primaryBlackColor),
        package: 'food_ninja'
    ),
    headline3: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      height: 1.31,
      color: Color(primaryBlackColor),
      package: 'food_ninja'
    ),
    headline4: TextStyle(
        fontSize: 20,
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
    headline2: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        height: 1.31,
        package: 'food_ninja'
    ),

    bodyText1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.67,
        package: 'food_ninja'
    ),
    bodyText2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      package: 'food_ninja'
    ),
  ),
  fontFamily: 'BentonSans',
);