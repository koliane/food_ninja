import 'route_action_enum.dart';
import 'route_action.dart';

mixin BaseRouteActions {
  RouteAction pushNamed(String routeName, [Object? payload]) {
    return RouteAction(
      name: routeName,
      action: RouteActionEnum.pushNamed,
      payload: payload
    );
  }

  RouteAction pop() {
    return RouteAction(
      action: RouteActionEnum.pop
    );
  }

  RouteAction maybePop() {
    return RouteAction(
      action: RouteActionEnum.maybePop
    );
  }

  RouteAction popUntil([String? untilName]) {
    return RouteAction(
      action: RouteActionEnum.popUntil,
      untilName: untilName
    );
  }

  RouteAction pushReplacementNamed(String routeName, [Object? payload]) {
    return RouteAction(
      name: routeName,
      action: RouteActionEnum.pushReplacementNamed,
      payload: payload
    );
  }

  RouteAction popAndPushNamed(String routeName, [Object? payload]) {
    return RouteAction(
      name: routeName,
      action: RouteActionEnum.popAndPushNamed,
      payload: payload
    );
  }

  RouteAction pushNamedAndRemoveUntil(String routeName, [String? untilName, Object? payload]) {
    return RouteAction(
      name: routeName,
      action: RouteActionEnum.pushNamedAndRemoveUntil,
      payload: payload,
      untilName: untilName
    );
  }
}