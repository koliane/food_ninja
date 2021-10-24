import 'package:flutter/material.dart';
import 'package:food_ninja/state/management/mobx/modules/auth/models/access_recovery_credentials.dart';
import 'package:food_ninja/state/management/mobx/modules/route/payloads/auth_verification_code_payload.dart';
import 'package:food_ninja/state/management/state_facade.dart';
import 'package:food_ninja/ui/widgets/base/input/base_text_input.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/step_page/step_page.dart';

class ForgotPasswordPage extends StatelessWidget {

  const ForgotPasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccessRecoveryCredentials credentials = StateFacade().auth.accessRecoveryContext.credentials;

    return PageScaffold(
      resizeToAvoidBottomInset: false,
        body: StepPage(
          onPressed: () {
            StateFacade().auth.sendAccessRecoveryVerificationCode();
          },
          title: 'Forgot password?',
          description: 'Select which contact details should we use to reset your password',
          buttonText: 'Next',
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                child: BaseTextInput(
                  initialValue: credentials.email,
                  onChanged: (value) {
                    credentials.email = value;
                  },
                  height: 81,
                  title: 'Via email:',
                  titleOffset: const Offset(82, 6),
                  prefixImage: 'assets/images/icons/email.svg',
                  prefixOffset: const Offset(29, 27),
                  padding: const EdgeInsets.fromLTRB(82, 43, 15, 14),
                  textStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 16
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}