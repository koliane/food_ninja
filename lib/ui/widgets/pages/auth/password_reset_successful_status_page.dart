import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/pages/status_page/status_page.dart';

class PasswordResetSuccessfulStatusPage extends StatelessWidget {
  const PasswordResetSuccessfulStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatusPage(
      text: 'Password reset successful',
      buttonText: 'Back',
    );
  }
}
