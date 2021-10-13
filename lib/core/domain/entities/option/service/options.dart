import '../model/bool_option.dart';
import '../model/option.dart';
import '../service/option_service.dart';
import '../service/options_props.dart';
import '../../skeleton/collection/base_collection.dart';
import 'package:food_ninja/core/infrastructure/utils/scalar/scalar.dart';

class Options {
  static Options instance = Options._internal();
  static final Map<String, Option> _optionsMap = {};
  late bool _needToShowOnboarding;


  Options._internal();


  Future<void> init() async {
    final BaseCollection<Option> collection = await const OptionService().getAllOptions();
    collection.forEach((element) {
      final String code = element.code;
      final value = element.value;
      _optionsMap[code] = element;

      switch(code) {
        case OptionsProps.needToShowOnboarding:
          _needToShowOnboarding = value;
          break;
      }
    });
  }

  Future<bool> _setValue(String code, newValue) async {
    final Option? option = _optionsMap[code];
    if(option == null) {
      return false;
    }
    final value = option.value;

    if(Scalar.isScalar(value) && value == newValue) {
      return true;
    }

    final Option newOption = option is BoolOption
        ? BoolOption(code, newValue)
        : Option(code, newValue)
    ;

    final bool status = await const OptionService().updateOption(newOption);

    if(!status) {
      return false;
    }

    option.value = newValue;

    return true;
  }


  bool get needToShowOnboarding => _needToShowOnboarding;

  Future<bool> setNeedToShowOnboarding(bool value) async {
    final bool updateStatus = await _setValue(OptionsProps.needToShowOnboarding, value);
    if(!updateStatus) {
      return false;
    }

    _needToShowOnboarding = value;

    return true;
  }

}