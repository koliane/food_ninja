import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/decoration.dart';
import 'package:food_ninja/ui/styles/default/text_style.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/base/button/radio_button.dart';
import 'package:food_ninja/ui/widgets/base/input/text_input.dart';
import 'package:food_ninja/ui/widgets/base/logo/logo_label.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class RegistrationPage extends StatelessWidget {
  static const double _mainContentHeight = 522;

  const RegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double logoHeight = (screenHeight - _mainContentHeight) * 0.57;

    return PageScaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: logoHeight,
                    child: LogoLabel(height: logoHeight),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      foregroundDecoration: backgroundPatternGradient,
                      child: Image.asset(
                        'assets/images/background/background_pattern.png',
                        width: 550,
                      ),
                    ),
                  )

                ],
              ),
            ),
            Text('Login To Your Account', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 43,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Column(
                      children: const [
                        TextInput(placeholder: "Login", prefixImage: 'assets/images/input/profile.svg', prefixCorrectiveLeftOffset: 4,),
                        SizedBox(height: 20,),
                        TextInput(placeholder: "Email", prefixImage: 'assets/images/input/message.svg', prefixCorrectiveTopOffset: -2,),
                        SizedBox(height: 20,),
                        TextInput(placeholder: "Password", prefixImage: 'assets/images/input/lock.svg', prefixCorrectiveTopOffset: -4,),
                      ]
                  ),
                  const SizedBox(height: 20,),

                  const RadioButton(text: 'Keep Me Signed In'),
                  const SizedBox(height: 12),
                  const RadioButton(text: 'Email Me About Special Pricing'),

                ],
              )
            ),

            const SizedBox(height: 20,),

            Column(
              mainAxisSize: MainAxisSize.min,
              children:[

              ]
            ),
            const SizedBox(height: 43,),

            const PrimaryButton('Create Account'),
            const SizedBox(height: 20,),
            Text('already have an account?', style: getAccentTextStyle(context)?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFF36d482)
            )),
            const SizedBox(height: 20,),
          ],
        )
    );
  }
}