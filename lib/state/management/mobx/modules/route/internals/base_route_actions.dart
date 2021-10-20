import 'package:food_ninja/state/routes/routes.dart';
import 'package:mobx/mobx.dart';

import 'route_action_enum.dart';
import 'route_action.dart';

part 'base_route_actions.g.dart';

class BaseRouteActions = _BaseRouteActions with _$BaseRouteActions;

abstract class _BaseRouteActions with Store {
  @observable
  RouteAction currentRoute = RouteAction(name: Routes.main, action: RouteActionEnum.init);

  @action
  void pushNamed(String routeName, [Object? payload]) {
    currentRoute = RouteAction(
      name: routeName,
      action: RouteActionEnum.pushNamed,
      payload: payload
    );
  }

  @action
  void pop() {
    currentRoute = RouteAction(
      action: RouteActionEnum.pop
    );
  }

  @action
  void maybePop() {
    currentRoute = RouteAction(
      action: RouteActionEnum.maybePop
    );
  }

  @action
  void popUntil([String? untilName]) {
    currentRoute = RouteAction(
      action: RouteActionEnum.popUntil,
      untilName: untilName
    );
  }

  @action
  void pushReplacementNamed(String routeName, [Object? payload]) {
    currentRoute = RouteAction(
      name: routeName,
      action: RouteActionEnum.pushReplacementNamed,
      payload: payload
    );
  }

  @action
  void popAndPushNamed(String routeName, [Object? payload]) {
    currentRoute = RouteAction(
      name: routeName,
      action: RouteActionEnum.popAndPushNamed,
      payload: payload
    );
  }

  @action
  void pushNamedAndRemoveUntil(String routeName, [String? untilName, Object? payload]) {
    currentRoute = RouteAction(
      name: routeName,
      action: RouteActionEnum.pushNamedAndRemoveUntil,
      payload: payload,
      untilName: untilName
    );
  }
}