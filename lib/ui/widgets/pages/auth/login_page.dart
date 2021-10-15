import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/ui/styles/default/gradient.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/base/input/text_input.dart';
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
        body: Container(
          child: Column(

            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: logoHeight,
                        child: LogoLabel(height: logoHeight),
                      ),

                      Positioned(
                        bottom: 0,
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
                            width: 550,
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
              Text('Login To Your Account', style: Theme.of(context).textTheme.headline4),
              SizedBox(height: 43,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Column(
                        children: [
                          TextInput(placeholder: "Email",),
                          SizedBox(height: 20,),
                          TextInput(placeholder: "Password",),
                        ]
                    ),
                    SizedBox(height: 20,),

                    Text('Or Continue With', style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 23,),

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
                        SizedBox(width: 21,),
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

              SizedBox(height: 20,),

              Text('Forgot Your Password?',
                style: Theme.of(context).primaryTextTheme.bodyText1?.copyWith(
                    foreground: Paint()..shader = LinearGradient(
                        colors: primaryGradientColors
                    ).createShader(Rect.fromLTWH(0, 0, 125, 20))
                ),
              ),
              SizedBox(height: 40,),

              PrimaryButton('Login', onPressed: null),
              SizedBox(height: 60,),
            ],
          ),
        )
    );
  }
}