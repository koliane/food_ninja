import 'package:food_ninja/state/management/state_facade.dart';

class StateBootstrap {
  static Future<void> appInit() async {
    StateFacade();
  }
}