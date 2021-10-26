import 'package:food_ninja/state/management/mobx/modules/app/app_state.dart';
import 'package:food_ninja/state/management/mobx/modules/auth/auth_state.dart';
import 'package:food_ninja/state/management/mobx/modules/main_page/main_page_state.dart';
import 'package:food_ninja/state/management/mobx/modules/onboarding/onboarding_state.dart';
import 'package:food_ninja/state/management/mobx/modules/route/route_state.dart';

class StateFacade {
  static final StateFacade _instance = StateFacade._internal();

  late final AppState app;
  late final RouteState route;
  OnboardingState? onboarding;
  AuthState? _auth;
  MainPageState? _mainPageState;

  StateFacade._internal(){
    app = AppState();
    route = RouteState.create();
  }

  factory StateFacade() {
    return _instance;
  }

  AuthState get auth {
    _auth ??= AuthState();

    return _auth!;
  }

  MainPageState get mainPage {
    _mainPageState ??= MainPageState.create();

    return _mainPageState!;
  }

}