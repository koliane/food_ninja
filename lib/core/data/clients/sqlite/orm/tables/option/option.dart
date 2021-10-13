import 'package:moor_flutter/moor_flutter.dart';

class Option extends Table {
  @override
  String get tableName => 'options';

  TextColumn get code => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {code};
}