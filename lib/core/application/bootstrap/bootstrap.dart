import 'package:food_ninja/core/domain/entities/option/service/options.dart';

import './di/di_bootstrap.dart';
import 'sqlite/sqlite_bootstrap.dart';

class Bootstrap {
  static Future appInit() {
    //TODO GetIt обновляет зависимости при хотрелоаде/рестарте, поэтому такой костыль. На проде заменить закомментированным кодом
    dynamic future  = Future.value(5);
    try {
      DiBootstrap.eventDispatcherToAppInit();
      DiBootstrap.providersToAppInit();

      future = Future.wait([
        SQLiteBootstrap.connect().then((value){
          Options().init();
        }),
      ]);
    }catch(e){}

    return future;


    // DiBootstrap.eventDispatcherToAppInit();
    // DiBootstrap.providersToAppInit();
    //
    // return Future.wait([
    //   SQLiteBootstrap.connect().then((value){
    //     Options().init();
    //   }),
    // ]);
  }
}