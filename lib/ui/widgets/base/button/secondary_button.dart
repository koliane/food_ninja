import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? height;

  const SecondaryButton(
    {
      required this.child,
      this.onPressed,
      this.padding,
      this.height,
      Key? key,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(secondaryComponentBackgroundColor),
          borderRadius: BorderRadius.circular(15)
        ),
        child: child,
      ),
    );
  }
}
