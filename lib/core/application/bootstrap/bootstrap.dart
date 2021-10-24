import 'package:food_ninja/core/domain/entities/option/service/options.dart';

import './di/di_bootstrap.dart';
import 'sqlite/sqlite_bootstrap.dart';

class Bootstrap {
  static Future appInit() {
    DiBootstrap.eventDispatcherToAppInit();
    DiBootstrap.providersToAppInit();

    return Future.wait([
      SQLiteBootstrap.connect().then((value){
        Options().init();
      }),
    ]);
  }
}