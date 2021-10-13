import 'package:food_ninja/core/data/clients/sqlite/orm/sqlite_orm.dart';

class SQLiteBootstrap {
  static Future<bool> connect() async {
    return SqliteOrm.instance.openConnection();
  }
}