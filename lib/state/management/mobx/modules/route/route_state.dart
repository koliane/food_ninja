import 'package:mobx/mobx.dart';
import 'package:food_ninja/state/management/mobx/modules/route/internals/base_route_actions.dart';
import 'package:food_ninja/state/routes/routes.dart';

part 'route_state.g.dart';

class RouteState = _RouteState with _$RouteState;

abstract class _RouteState extends BaseRouteActions with Store {

  @action
  void goToRootLoginPage() {
    pushNamedAndRemoveUntil(Routes.login);
  }

  @action
  void goToRootRegistrationPage() {
    pushNamedAndRemoveUntil(Routes.registration);
  }
}