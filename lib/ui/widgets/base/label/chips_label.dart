import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/color.dart';

class ChipsLabel extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? height;

  const ChipsLabel({
    required this.child,
    this.padding,
    this.height,
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
      child: child
    );
  }
}
