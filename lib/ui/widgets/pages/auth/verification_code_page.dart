import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ninja/state/management/mobx/modules/route/payloads/auth_verification_code_payload.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';
import 'package:food_ninja/ui/widgets/scenes/step_page/step_page.dart';

class VerificationCodePage extends StatelessWidget {

  const VerificationCodePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routePayload = ModalRoute.of(context)!.settings.arguments as AuthVerificationCodePayload;

    return PageScaffold(
      resizeToAvoidBottomInset: false,
      body: StepPage(
        onPressed: routePayload.action,
        title: 'Enter 4-digit\nVerification code',
        description: 'Code send to ${routePayload.email}',
        buttonText: 'Next',
        child: Column(
          children: [
            const SizedBox(height: 38,),
            Container(
              height: 103,
              margin: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: primaryShadow
              ),
              child: TextFormField(
                onChanged: routePayload.onChanged,
                autofocus: true,
                showCursor: false,
                style: const TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  letterSpacing: 70,
                  decoration: TextDecoration.none,
                  package: 'food_ninja'
                ),

                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 28)
                ),
                // maxLength: 4,
                inputFormatters:[
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}