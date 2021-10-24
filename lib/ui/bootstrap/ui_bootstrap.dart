import 'package:food_ninja/ui/service/listeners/route/state_route_listener.dart';
import 'package:food_ninja/ui/service/listeners/scaffold/snack_bar_listener.dart';

class UiBootstrap {
  static Future<void> appInit() async {
    StateRouteListener().init();
    SnackBarListener().init();
  }
}