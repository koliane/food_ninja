import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/scenes/app_bar/top_app_bar.dart';

class StepPage extends StatelessWidget {
  final String title;
  final String buttonText;
  final String description;
  final Widget child;
  final VoidCallback onPressed;

  const StepPage({
    required this.title,
    required this.buttonText,
    required this.description,
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double topSafeAreaHeight = MediaQuery.of(context).padding.top;
    final double screenHeight = MediaQuery.of(context).size.height;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: screenHeight
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Positioned(
              top: 0,
              left: 0,
              child: TopAppBar()
          ),
          Positioned(
            top: -580,
            right: -250,
            child: Transform.rotate(
              angle: 20 * math.pi / 180,
              child: Image.asset(
                'assets/images/background/background_pattern.png',
                width: 500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: topSafeAreaHeight == 0 ? 83 : 60 + topSafeAreaHeight,
              bottom: 117,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headline1),
                      const SizedBox(height: 20,),
                      Text(description, style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ),

                child
              ],
            ),
          ),
          Positioned(
              top: 660,
              child: PrimaryButton(buttonText, onPressed: onPressed,)
          )
        ],
      ),
    );
  }
}
