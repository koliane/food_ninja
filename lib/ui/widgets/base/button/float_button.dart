import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/color.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';

class FloatButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const FloatButton({
    required this.child,
    this.width,
    this.height,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(fillWhiteColor),
        boxShadow: buttonShadow
      ),
      child: child,
    );
  }
}
