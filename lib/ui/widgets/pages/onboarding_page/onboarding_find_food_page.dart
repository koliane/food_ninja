import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_page_scaffold.dart';

class OnboardingFindFoodPage extends StatelessWidget {
  final VoidCallback action;

  const OnboardingFindFoodPage({
    required this.action,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return OnboardingPageScaffold(
      image: 'assets/images/onboarding/find_food.png',
      title: 'Find your Comfort\nFood here',
      description: 'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
      action: action
    );
  }
}