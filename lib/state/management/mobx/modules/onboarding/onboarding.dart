import 'package:food_ninja/core/domain/entities/option/service/options.dart';
import 'package:food_ninja/state/management/store_facade.dart';
import 'package:mobx/mobx.dart';

part 'onboarding.g.dart';

class Onboarding = _Onboarding with _$Onboarding;

abstract class _Onboarding with Store {
  @action
  void closeOnboarding() {
    Options().setNeedToShowOnboarding(false);
    StoreFacade().routeStore.goToRootLoginPage();
  }
}