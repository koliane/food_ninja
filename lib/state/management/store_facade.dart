import 'package:food_ninja/state/management/mobx/modules/app/app_store.dart';
import 'package:food_ninja/state/management/mobx/modules/onboarding/onboarding.dart';
import 'package:food_ninja/state/management/mobx/modules/route/route_store.dart';

class StoreFacade {
  static final StoreFacade _instance = StoreFacade._internal();

  late final AppStore appStore;
  late final RouteStore routeStore;
  Onboarding? onboarding;

  StoreFacade._internal(){
    appStore = AppStore();
    routeStore = RouteStore();
  }

  factory StoreFacade() {
    return _instance;
  }


}