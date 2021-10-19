import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';
import 'package:food_ninja/ui/styles/default/text_style.dart';
import 'package:food_ninja/ui/widgets/base/text/gradient_text.dart';

class PrimaryGradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const PrimaryGradientText(this.text, {
    this.style,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = defaultTextStyle.copyWith(
      // fontSize: 19,
      fontWeight: FontWeight.bold,
      height: 1,
    );

    return GradientText(text,
      style: style == null ? textStyle : textStyle.merge(style),
      colors: primaryGradientColors,
    );
  }
}