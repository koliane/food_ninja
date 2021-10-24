import 'package:flutter/material.dart';
import 'package:food_ninja/state/management/mobx/modules/auth/models/registration_credentials.dart';
import 'package:food_ninja/state/management/state_facade.dart';
import 'package:food_ninja/ui/widgets/base/button/primary_button.dart';
import 'package:food_ninja/ui/widgets/base/button/radio_button.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/base/text/primary_gradient_text.dart';
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
    final RegistrationCredentials credentials = StateFacade().auth.registrationContext.credentials;

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
                            children: [
                              BaseTextInput(
                                initialValue: credentials.login,
                                onChanged: (String value) {
                                  credentials.login = value;
                                },
                                placeholder: "Login",
                                prefixImage: 'assets/images/icons/profile.svg',
                                prefixCorrectiveOffset: const Offset(4, 0),
                              ),
                              const SizedBox(height: 20,),
                              BaseTextInput(
                                initialValue: credentials.email,
                                onChanged: (String value) {
                                  credentials.email = value;
                                },
                                placeholder: "Email",
                                prefixImage: 'assets/images/icons/message.svg',
                                prefixCorrectiveOffset: const Offset(0, -2),
                              ),
                              const SizedBox(height: 20,),
                              BaseTextInput(
                                initialValue: credentials.password,
                                onChanged: (String value) {
                                  credentials.password = value;
                                },
                                placeholder: "Password",
                                prefixImage: 'assets/images/icons/lock.svg',
                                prefixCorrectiveOffset: const Offset(0, -4),
                                obscureText: true,
                              ),
                            ]
                        ),
                        const SizedBox(height: 20,),

                        RadioButton(text: 'Keep Me Signed In',
                          onPressed: () {
                            StateFacade().app.showSnackBar('Нет макета для отжатой кнопки');
                          },
                        ),
                        const SizedBox(height: 12),
                        RadioButton(text: 'Email Me About Special Pricing',
                          onPressed: () {
                            StateFacade().app.showSnackBar('Нет макета для отжатой кнопки');
                          },
                        ),
                      ],
                    )
                ),

                const SizedBox(height: 43,),

                PrimaryButton('Create Account',
                  onPressed: () {
                    StateFacade().auth.register();
                  },
                ),
                const SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){
                    StateFacade().route.goToRootLoginPage();
                  },
                  child: const PrimaryGradientText('already have an account?', style: TextStyle(
                      decoration: TextDecoration.underline,
                  ),
                  ),
                ),

                const SizedBox(height: 20,),
              ],
            ),

          ],
        ),
      )
    );
  }
}