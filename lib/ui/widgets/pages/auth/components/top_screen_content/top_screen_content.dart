import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/decoration.dart';
import 'package:food_ninja/ui/widgets/base/logo/logo_label.dart';

class TopScreenContent extends StatelessWidget {
  final double freeSpace;

  const TopScreenContent({
    required this.freeSpace,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double logoHeight = freeSpace * 0.6;

    return SizedBox(
      height: freeSpace,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [

          Positioned(
            bottom: 0,
            child: Container(
              foregroundDecoration: backgroundPatternGradient,
              child: Image.asset(
                'assets/images/background/background_pattern.png',
                width: 550,
              ),
            ),
          ),
          SizedBox(
            height: logoHeight,
            child: LogoLabel(height: logoHeight),
          ),

        ],
      ),
    );
  }
}
