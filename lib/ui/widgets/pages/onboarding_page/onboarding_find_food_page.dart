import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_page.dart';

class OnboardingFindFoodPage extends StatelessWidget {
  const OnboardingFindFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const OnboardingPage(
        image: 'assets/images/onboarding/find_food.png',
        title: 'Find your Comfort\nFood here',
        description: 'Here You Can find a chef or dish for every\ntaste and color. Enjoy!'
    );
  }
}