import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/step_page/step_page.dart';

class NewPasswordPage extends StatelessWidget {

  const NewPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageScaffold(
        body: SingleChildScrollView(
          child: StepPage(
            title: 'Reset your password\nhere',
            description: 'Select which contact details should we\nuse to reset your password',
            buttonText: 'Next',
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: const [
                      BaseTextInput(
                        placeholder: 'New Password',
                        obscureText: true,
                        height: 61,
                      ),
                      SizedBox(height: 20),

                      BaseTextInput(
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