import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/decoration.dart';
import 'package:food_ninja/ui/widgets/base/logo/logo_label.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(width: 500),
                const Positioned(
                    child: LogoLabel(width: 190,)
                ),
                Positioned(
                  bottom: 200,
                  child: Container(
                    foregroundDecoration: backgroundPatternGradient,
                    child: Image.asset(
                      'assets/images/background/background_pattern.png',
                    ),
                  ),
                )

              ],
            ),
          ],
        )
    );
  }
}