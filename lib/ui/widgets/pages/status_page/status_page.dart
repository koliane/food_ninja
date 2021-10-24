import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/state/management/state_facade.dart';
import 'package:food_ninja/ui/styles/default/decoration.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class StatusPage extends StatelessWidget {
  static const double statusImageHeight = 162;

  final String text;
  final String buttonText;
  final VoidCallback action;
  final VoidCallback? init;

  const StatusPage({
    required this.text,
    required this.buttonText,
    required this.action,
    this.init,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      init: init,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: statusImageHeight / 2,
                    child: Container(
                      foregroundDecoration: backgroundPatternGradient,
                      child: Image.asset(
                        'assets/images/background/background_pattern.png',
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/images/status/page_success_status.svg', height: statusImageHeight,),
                ],
              ),
              const SizedBox(height: 33,),
              Text('Congrats!',
                style: Theme.of(context).primaryTextTheme.headline2?.copyWith(
                  foreground: Paint()..shader =  const LinearGradient(
                    colors: primaryGradientColors
                  ).createShader(const Rect.fromLTWH(0, 0, 131, 54))
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12,),
              Text(text, style: Theme.of(context).textTheme.headline2, textAlign: TextAlign.center,),
            ],
          ),

          Positioned(
            bottom: 60,
            child: PrimaryButton(buttonText, onPressed: action,),
          )
        ],
      )
    );
  }
}
