import 'package:food_ninja/core/domain/entities/option/service/options_props.dart';

import '../../sqlite_orm.dart';
import '../../tables/option/option_dao.dart';

import '../base_migration.dart';

class InitMigration extends BaseMigration {
  @override
  Future up() async {
    final OptionData data = OptionData(code: OptionsProps.needToShowOnboarding, value: "1");
    await OptionDao().insertOption(data);
  }

}