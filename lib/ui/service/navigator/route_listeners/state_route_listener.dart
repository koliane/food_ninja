import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:food_ninja/state/management/mobx/modules/route/internals/route_action.dart';
import 'package:food_ninja/state/management/store_facade.dart';
import 'package:food_ninja/ui/service/app/app_global_keys.dart';

class StateRouteListener {
  static late final StateRouteListener _instance = StateRouteListener._();

  StateRouteListener._();

  factory StateRouteListener() {

    return _instance;
  }

  void init() {
    reaction<RouteAction>(
      (Reaction reaction) => StoreFacade().routeStore.currentRoute,
      (routeAction) {
        final NavigatorState? nav = AppGlobalKeys.rootNavigatorKey.currentState;
        if(nav == null) {
          return;
        }

        if (routeAction.isPushNamed()) {
          nav.pushNamed(routeAction.name!, arguments: routeAction.payload);
          return;
        }

        if (routeAction.isPop()) {
          nav.pop();
          return;
        }

        if (routeAction.isMaybePop()) {
          nav.maybePop();
          return;
        }

        if (routeAction.isPopUntil()) {
          nav.popUntil(routeAction.untilName == null
              ? (Route route) => false
              : ModalRoute.withName(routeAction.untilName!)
          );
          return;
        }

        if (routeAction.isPushReplacementNamed()) {
          nav.pushReplacementNamed(
              routeAction.name!, arguments: routeAction.payload);
          return;
        }

        if (routeAction.isPopAndPushNamed()) {
          nav.popAndPushNamed(routeAction.name!, arguments: routeAction.payload);
          return;
        }

        if (routeAction.isPushNamedAndRemoveUntil()) {
          nav.pushNamedAndRemoveUntil(
              routeAction.name!,
              routeAction.untilName == null
                  ? (Route route) => false
                  : ModalRoute.withName(routeAction.untilName!),
              arguments: routeAction.payload
          );
          return;
        }

    });

  }

}