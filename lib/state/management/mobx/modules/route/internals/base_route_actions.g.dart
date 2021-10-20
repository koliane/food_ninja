// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_route_actions.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseRouteActions on _BaseRouteActions, Store {
  final _$currentRouteAtom = Atom(name: '_BaseRouteActions.currentRoute');

  @override
  RouteAction get currentRoute {
    _$currentRouteAtom.reportRead();
    return super.currentRoute;
  }

  @override
  set currentRoute(RouteAction value) {
    _$currentRouteAtom.reportWrite(value, super.currentRoute, () {
      super.currentRoute = value;
    });
  }

  final _$_BaseRouteActionsActionController =
      ActionController(name: '_BaseRouteActions');

  @override
  void pushNamed(String routeName, [Object? payload]) {
    final _$actionInfo = _$_BaseRouteActionsActionController.startAction(
        name: '_BaseRouteActions.pushNamed');
    try {
      return super.pushNamed(routeName, payload);
    } finally {
      _$_BaseRouteActionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pop() {
    final _$actionInfo = _$_BaseRouteActionsActionController.startAction(
        name: '_BaseRouteActions.pop');
    try {
      return super.pop();
    } finally {
      _$_BaseRouteActionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void maybePop() {
    final _$actionInfo = _$_BaseRouteActionsActionController.startAction(
        name: '_BaseRouteActions.maybePop');
    try {
      return super.maybePop();
    } finally {
      _$_BaseRouteActionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void popUntil([String? untilName]) {
    final _$actionInfo = _$_BaseRouteActionsActionController.startAction(
        name: '_BaseRouteActions.popUntil');
    try {
      return super.popUntil(untilName);
    } finally {
      _$_BaseRouteActionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pushReplacementNamed(String routeName, [Object? payload]) {
    final _$actionInfo = _$_BaseRouteActionsActionController.startAction(
        name: '_BaseRouteActions.pushReplacementNamed');
    try {
      return super.pushReplacementNamed(routeName, payload);
    } finally {
      _$_BaseRouteActionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void popAndPushNamed(String routeName, [Object? payload]) {
    final _$actionInfo = _$_BaseRouteActionsActionController.startAction(
        name: '_BaseRouteActions.popAndPushNamed');
    try {
      return super.popAndPushNamed(routeName, payload);
    } finally {
      _$_BaseRouteActionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pushNamedAndRemoveUntil(String routeName,
      [String? untilName, Object? payload]) {
    final _$actionInfo = _$_BaseRouteActionsActionController.startAction(
        name: '_BaseRouteActions.pushNamedAndRemoveUntil');
    try {
      return super.pushNamedAndRemoveUntil(routeName, untilName, payload);
    } finally {
      _$_BaseRouteActionsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentRoute: ${currentRoute}
    ''';
  }
}
