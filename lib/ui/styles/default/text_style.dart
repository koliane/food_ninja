import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';

TextStyle? getAccentTextStyle(BuildContext context, [double width = 125, double height = 20]) {
  return Theme.of(context).primaryTextTheme.bodyText1?.copyWith(
      foreground: Paint()..shader = const LinearGradient(
        colors: primaryGradientColors
      ).createShader(Rect.fromLTWH(0, 0, width, height))
  );
}