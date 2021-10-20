import 'package:food_ninja/core/domain/entities/option/service/options.dart';
import 'package:food_ninja/state/management/state_facade.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_state.g.dart';

class OnboardingState = _OnboardingState with _$OnboardingState;

abstract class _OnboardingState with Store {
  @action
  void closeOnboarding() {
    Options().setNeedToShowOnboarding(false);
    StateFacade().route.goToRootLoginPage();
  }
}