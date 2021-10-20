import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/base/text/primary_gradient_text.dart';

class PrimaryTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const PrimaryTextButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: PrimaryGradientText(text, style: textStyle,),
    );
  }
}
