import 'package:mobx/mobx.dart';
import 'package:food_ninja/state/management/mobx/modules/route/internals/base_route_actions.dart';
import 'package:food_ninja/state/routes/routes.dart';

part 'route_store.g.dart';

class RouteStore = _RouteStore with _$RouteStore;

abstract class _RouteStore extends BaseRouteActions with Store {

  @action
  void goToRootLoginPage() {
    pushNamedAndRemoveUntil(Routes.login);
  }

  @action
  void goToRootRegistrationPage() {
    pushNamedAndRemoveUntil(Routes.registration);
  }
}