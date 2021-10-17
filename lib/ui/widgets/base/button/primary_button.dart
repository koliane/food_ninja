import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback? onPressed;

  const PrimaryButton(
    this.text,
    {
      this.width,
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
        width: width ?? 157,
        height: 57,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: primaryGradientColors
          ),
          borderRadius: BorderRadius.all(Radius.circular(primaryRadius))
        ),
        child: Text(text, style: Theme.of(context).primaryTextTheme.bodyText2),
      ),
    );
  }
}
