import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/widgets/base/text/primary_gradient_text.dart';

class TextChipsLabel extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;
  final double? height;
  final double? textWidth;
  final double? textHeight;
  final FontWeight? fontWeight;
  final double? fontSize;

  const TextChipsLabel({
    required this.text,
    this.padding,
    this.height,
    this.textWidth,
    this.textHeight,
    this.fontWeight,
    this.fontSize,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 34,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(primaryLabelColor)
      ),

      child: PrimaryGradientText(text, style: TextStyle(
          height: 1,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize ?? 12
      ),),
    );
  }
}