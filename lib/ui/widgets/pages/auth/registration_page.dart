import 'package:flutter/material.dart';
import 'package:food_ninja/ui/styles/default/text_style.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/base/button/radio_button.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/pages/auth/components/top_screen_content/top_screen_content.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class RegistrationPage extends StatelessWidget {
  static const double _mainContentHeight = 516;

  const RegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topFreeSpace = screenHeight - _mainContentHeight;

    return PageScaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopScreenContent(freeSpace: topFreeSpace),
              Column(
                children: [
                  Text('Login To Your Account', style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 43,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Column(
                              children: const [
                                BaseTextInput(placeholder: "Login", prefixImage: 'assets/images/input/profile.svg', prefixCorrectiveOffset: Offset(4, 0),),
                                SizedBox(height: 20,),
                                BaseTextInput(placeholder: "Email", prefixImage: 'assets/images/input/message.svg', prefixCorrectiveOffset:  Offset(0, -2),),
                                SizedBox(height: 20,),
                                BaseTextInput(placeholder: "Password", prefixImage: 'assets/images/input/lock.svg', prefixCorrectiveOffset:  Offset(0, -4),),
                              ]
                          ),
                          const SizedBox(height: 20,),

                          const RadioButton(text: 'Keep Me Signed In'),
                          const SizedBox(height: 12),
                          const RadioButton(text: 'Email Me About Special Pricing'),
                        ],
                      )
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
              ),

            ],
          ),
        )
    );
  }
}