import 'package:flutter/material.dart';
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
                    child: LogoLabel()
                ),
                Positioned(
                  bottom: 200,
                  child: Container(
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.9, 1],
                          colors: [
                            Color(0x00FFFFFF),
                            Color(0xF8FFFFFF),
                          ]
                      ),
                    ),
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