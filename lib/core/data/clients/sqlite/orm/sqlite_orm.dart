import 'dart:async';
import 'dart:io';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:food_ninja/core/application/env/env.dart';
import 'tables/tables.dart';
import 'migrations/default_migration_strategy.dart';
import '../sqlite.dart';

part 'sqlite_orm.g.dart';

@UseMoor(
    tables: [
      Option
    ],
    daos: [
      OptionDao
    ]
)
class SqliteOrm extends _$SqliteOrm {
  static SqliteOrm instance = SqliteOrm._internal();

  static LazyDatabase _getDb() {
    return LazyDatabase(() async {
      final folder = await getApplicationDocumentsDirectory();
      File file = File(p.join(folder.path, SQLite.dbFileName));

      if(Env.needToSqliteRebuild) {
        if(file.existsSync()) {
          await file.delete();
          file = File(p.join(folder.path, SQLite.dbFileName));
        }
      }

      return VmDatabase(file);
    });
  }

  SqliteOrm._internal(): super(_getDb());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => DefaultMigrationStrategy();


  Future<bool> openConnection() async {
    return executor.ensureOpen(this);
  }

}