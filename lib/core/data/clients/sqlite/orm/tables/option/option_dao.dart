import 'package:moor_flutter/moor_flutter.dart';
import '../../sqlite_orm.dart';
import 'option.dart';

part 'option_dao.g.dart';

@UseDao(tables: [Option])
class OptionDao extends DatabaseAccessor<SqliteOrm> with _$OptionDaoMixin {
  static final SqliteOrm _attachedDatabase = SqliteOrm.instance;
  OptionDao([SqliteOrm? forCompatibility]): super(_attachedDatabase);

  Future<List<OptionData>> getAllOptions() => select(option).get();
  Future<int> insertOption(OptionData optionItem) => into(option).insert(optionItem);
  Future<bool> updateOption(OptionData optionItem) => update(option).replace(optionItem);
}