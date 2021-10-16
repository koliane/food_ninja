import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ninja/ui/styles/default/shadow.dart';
import 'package:food_ninja/ui/widgets/pages/step_page/step_page.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class VerificationCodePage extends StatelessWidget {

  const VerificationCodePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageScaffold(
      resizeToAvoidBottomInset: false,
        body: StepPage(
          title: 'Enter 4-digit\nVerification code',
          description: 'Code send to +6282045**** . This code will\nexpired in 01:30',
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
                child: TextField(
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