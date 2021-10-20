import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_page_scaffold.dart';

class OnboardingDeliveryPage extends StatelessWidget {
  final VoidCallback action;

  const OnboardingDeliveryPage({
    required this.action,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return OnboardingPageScaffold(
      image: 'assets/images/onboarding/delivery_food.png',
      title: 'Food Ninja is Where Your\nComfort Food Lives',
      description: 'Enjoy a fast and smooth food delivery\nat your doorstep',
      action: action,
    );
  }
}