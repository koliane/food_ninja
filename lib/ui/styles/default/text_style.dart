import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';

TextStyle? getAccentTextStyle(BuildContext context) {
  return Theme.of(context).primaryTextTheme.bodyText1?.copyWith(
      foreground: Paint()..shader = const LinearGradient(
      colors: primaryGradientColors
      ).createShader(const Rect.fromLTWH(0, 0, 125, 20))
  );
}