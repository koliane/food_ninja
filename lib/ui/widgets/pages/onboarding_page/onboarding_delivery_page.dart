import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_page.dart';

class OnboardingDeliveryPage extends StatelessWidget {
  const OnboardingDeliveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const OnboardingPage(
        image: 'assets/images/onboarding/delivery_food.png',
        title: 'Food Ninja is Where Your\nComfort Food Lives',
        description: 'Enjoy a fast and smooth food delivery\nat your doorstep'
    );
  }
}