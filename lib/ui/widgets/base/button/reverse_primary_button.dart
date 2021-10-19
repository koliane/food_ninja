import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';
import 'package:food_ninja/ui/widgets/base/text/primary_gradient_text.dart';

class ReversePrimaryButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback? onPressed;
  final double? textWidth;
  final double? textHeight;

  const ReversePrimaryButton(
    this.text,
    {
      this.width,
      this.textWidth,
      this.textHeight,
      Key? key,
      this.onPressed
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 57,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(primaryRadius))
        ),
        child: PrimaryGradientText(text, style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        )),
      ),
    );
  }
}
