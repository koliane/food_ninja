import 'package:food_ninja/core/domain/entities/option/service/options.dart';

import './di/di_bootstrap.dart';
import 'sqlite/sqlite_bootstrap.dart';

class Bootstrap {
  static Future<void> appInit() async {

    SQLiteBootstrap.connect().then((value){
      Options.instance.init();
    });

    DiBootstrap.eventDispatcherToAppInit();
    DiBootstrap.providersToAppInit();
  }
}