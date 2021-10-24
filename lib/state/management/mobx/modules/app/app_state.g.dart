// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on _AppState, Store {
  final _$snackBarAtom = Atom(name: '_AppState.snackBar');

  @override
  StateSnackBarAction get snackBar {
    _$snackBarAtom.reportRead();
    return super.snackBar;
  }

  @override
  set snackBar(StateSnackBarAction value) {
    _$snackBarAtom.reportWrite(value, super.snackBar, () {
      super.snackBar = value;
    });
  }

  final _$_AppStateActionController = ActionController(name: '_AppState');

  @override
  void showSnackBar(String text) {
    final _$actionInfo =
        _$_AppStateActionController.startAction(name: '_AppState.showSnackBar');
    try {
      return super.showSnackBar(text);
    } finally {
      _$_AppStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
snackBar: ${snackBar}
    ''';
  }
}
