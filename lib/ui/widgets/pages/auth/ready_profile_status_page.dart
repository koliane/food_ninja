import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/pages/status_page/status_page.dart';

class ReadyProfileStatusPage extends StatelessWidget {
  const ReadyProfileStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StatusPage(
      text: 'Your Profile Is Ready To Use',
      buttonText: 'Try Order',
    );
  }
}
