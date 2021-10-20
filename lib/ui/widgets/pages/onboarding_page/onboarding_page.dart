import 'package:flutter/material.dart';
import 'package:food_ninja/state/management/mobx/modules/onboarding/onboarding.dart';
import 'package:food_ninja/state/management/store_facade.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_delivery_page.dart';
import 'package:food_ninja/ui/widgets/pages/onboarding_page/onboarding_find_food_page.dart';
import 'package:food_ninja/ui/widgets/scenes/page_scaffold/page_scaffold.dart';

class OnboardingPage extends StatelessWidget {
  final PageController pageController = PageController();

  OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      init: (){
        StoreFacade().onboarding = Onboarding();
      },
      dispose: () {
        StoreFacade().onboarding = null;
      },
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          OnboardingFindFoodPage(action: (){
            pageController.nextPage(duration: const Duration(milliseconds: 150), curve: Curves.easeInOut);
          },),
          OnboardingDeliveryPage(action: (){
            StoreFacade().onboarding?.closeOnboarding();
          },),
        ],
      ),
    );
  }
}
