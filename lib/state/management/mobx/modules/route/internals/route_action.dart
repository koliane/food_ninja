import 'route_action_enum.dart';

class RouteAction {
  final String? name;
  final Object? payload;
  final RouteActionEnum action;
  final String? untilName;

  RouteAction({
    this.name,
    required this.action,
    this.payload,
    this.untilName,
  });

  bool isPushNamed() {
    return action == RouteActionEnum.pushNamed;
  }

  bool isPop() {
    return action == RouteActionEnum.pop;
  }

  bool isMaybePop() {
    return action == RouteActionEnum.maybePop;
  }

  bool isPopUntil() {
    return action == RouteActionEnum.popUntil;
  }

  bool isPushReplacementNamed() {
    return action == RouteActionEnum.pushReplacementNamed;
  }

  bool isPopAndPushNamed() {
    return action == RouteActionEnum.popAndPushNamed;
  }

  bool isPushNamedAndRemoveUntil() {
    return action == RouteActionEnum.pushNamedAndRemoveUntil;
  }
}