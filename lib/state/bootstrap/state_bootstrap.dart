import 'package:food_ninja/state/management/store_facade.dart';

class StateBootstrap {
  static Future<void> appInit() async {
    StoreFacade();
  }
}