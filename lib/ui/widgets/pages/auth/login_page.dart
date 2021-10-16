import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/decoration.dart';
import 'package:food_ninja/ui/styles/default/text_style.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/base/logo/logo_label.dart';
import 'package:food_ninja/ui/widgets/pages/auth/components/oauth_card/oauth_card.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class LoginPage extends StatelessWidget {
  static const double _mainContentHeight = 522;

  const LoginPage({
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
                        BaseTextInput(placeholder: "Email",),
                        SizedBox(height: 20,),
                        BaseTextInput(placeholder: "Password",),
                      ]
                  ),
                  const SizedBox(height: 20,),

                  Text('Or Continue With', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 23,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OauthCard(
                          image: SvgPicture.asset('assets/images/social_services/facebook.svg'),
                          text: 'Facebook',
                          onPressed: () => print("Facebook"),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: OauthCard(
                          image: SvgPicture.asset('assets/images/social_services/google.svg'),
                          text: 'Google',
                          onPressed: () => print("Google")
                        ),
                      )
                    ],
                  ),
                ],
              )
            ),

            const SizedBox(height: 20,),

            Text('Forgot Your Password?', style: getAccentTextStyle(context)?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: const Color(0xFF36d482)
            )),

            const SizedBox(height: 40,),

            const PrimaryButton('Login'),
            const SizedBox(height: 60,),
          ],
        )
    );
  }
}