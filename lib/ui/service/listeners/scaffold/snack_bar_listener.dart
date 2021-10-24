import 'package:flutter/material.dart';
import 'package:food_ninja/state/management/mobx/modules/app/internals/state_snack_bar_action.dart';
import 'package:food_ninja/state/management/state_facade.dart';
import 'package:food_ninja/ui/service/app/app_global_keys.dart';
import 'package:mobx/mobx.dart';

class SnackBarListener {
  static late final SnackBarListener _instance = SnackBarListener._();

  SnackBarListener._();

  factory SnackBarListener() {
    return _instance;
  }

  void init() {
    reaction<StateSnackBarAction>(
      (Reaction reaction) => StateFacade().app.snackBar,
      (routeAction) {
        final BuildContext context = AppGlobalKeys.currentPageKey.currentContext!;
        final SnackBar snackBarWidget = SnackBar(content: Text(routeAction.text));

        ScaffoldMessenger.of(context).showSnackBar(snackBarWidget);
      }
    );
  }
}