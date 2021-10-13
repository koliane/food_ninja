import '../config.dart';

class DevConfig extends Config {
  DevConfig() {
    needToSqliteRebuild = true;
  }
}