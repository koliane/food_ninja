import 'package:flutter/material.dart';
import 'package:food_ninja/state/management/mobx/modules/auth/models/access_recovery_credentials.dart';
import 'package:food_ninja/state/management/state_facade.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/step_page/step_page.dart';

class NewPasswordPage extends StatelessWidget {
  String firstPassword = '';
  String secondPassword = '';

  NewPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccessRecoveryCredentials credentials = StateFacade().auth.accessRecoveryContext.credentials;

    return PageScaffold(
        body: SingleChildScrollView(
          child: StepPage(
            onPressed: () {
              if(firstPassword != secondPassword) {
                StateFacade().app.showSnackBar('Введенные пароли не равны');
                return;
              }

              StateFacade().auth.createNewPassword();
            },
            title: 'Reset your password\nhere',
            description: 'Select which contact details should we\nuse to reset your password',
            buttonText: 'Next',
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      BaseTextInput(
                        onChanged: (value) {
                          firstPassword = value;
                        },
                        placeholder: 'New Password',
                        obscureText: true,
                        height: 61,
                      ),
                      const SizedBox(height: 20),

                      BaseTextInput(
                        onChanged: (value) {
                          secondPassword = value;
                          credentials.password = value;
                        },
                        placeholder: 'Confirm Password',
                        obscureText: true,
                        height: 61,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}