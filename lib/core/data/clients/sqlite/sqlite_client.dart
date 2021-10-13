import 'orm/sqlite_orm.dart';
import 'orm/tables/option/option_dao.dart';

import '../skeleton/base_client.dart';

class SqliteClient extends BaseClient {
  static Future<List<OptionData>> getOptions() async {
    return OptionDao().getAllOptions();
  }

  static Future<bool> updateOption(String code, String value) async {
    return OptionDao().updateOption(OptionData(code: code, value: value));
  }
}