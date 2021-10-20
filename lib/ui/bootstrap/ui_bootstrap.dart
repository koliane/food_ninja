import 'package:food_ninja/ui/service/navigator/route_listeners/state_route_listener.dart';

class UiBootstrap {
  static Future<void> appInit() async {
    StateRouteListener().init();
  }
}