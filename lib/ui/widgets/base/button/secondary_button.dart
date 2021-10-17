import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';
import 'package:food_ninja/ui/styles/default/radius.dart';

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const SecondaryButton(
    {
      required this.child,
      Key? key,
      this.onPressed
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(secondaryComponentBackgroundColor),
          borderRadius: BorderRadius.circular(15)
        ),
        child: child,
      ),
    );
  }
}
