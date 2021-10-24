import 'internals/state_snack_bar_action.dart';
import 'package:mobx/mobx.dart';

part 'app_state.g.dart';

class AppState = _AppState with _$AppState;

abstract class _AppState with Store {
  @observable
  StateSnackBarAction snackBar = const StateSnackBarAction('');

  @action
  void showSnackBar(String text) {
    snackBar = StateSnackBarAction(text);
  }
}