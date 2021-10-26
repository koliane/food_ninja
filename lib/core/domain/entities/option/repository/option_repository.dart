import 'package:food_ninja/core/domain/entities/option/request/read_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/request/update_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/response/all_options_response.dart';

import '../model/bool_option.dart';
import '../model/option.dart';
import '../port/provider/option_crud_provider_port.dart';
import '../service/options_props.dart';
import '../../skeleton/collection/base_collection.dart';
import '../../skeleton/model/base_model.dart';
import '../../skeleton/repository/base_repository.dart';
import '../../skeleton/repository/crud_repository.dart';
import 'package:food_ninja/core/infrastructure/di/provider_di.dart';

class OptionRepository extends BaseRepository implements CrudRepository<Option> {
  const OptionRepository();

  @override
  Future<int> create(BaseModel model) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<BaseCollection<Option>> read() async {
    final OptionCrudProviderPort provider = ProviderDi.getOptionReadProvider();
    final AllOptionsResponse response = await provider.send(ReadOptionRequest());

    final BaseCollection<Option> collection = BaseCollection<Option>();
    response.ordinary.forEach((element) {
      final Option option = _createOption(element.code, element.value, false);
      collection.add(option);
    });

    response.secure.forEach((element) {
      final Option option = _createOption(element.code, element.value, true);
      collection.add(option);
    });

    return collection;
  }

  Option _createOption(String code, String value, bool isSecure) {
    Option option;
    if(OptionsProps.isBool(code)) {
      option = BoolOption(code, value == "1", isSecure: isSecure);
    } else {
      option = Option<String>(code, value, isSecure: isSecure);
    }

    return option;
  }

  @override
  Future<bool> update(covariant Option model) async {
    final OptionCrudProviderPort provider = ProviderDi.getOptionUpdateProvider();
    String value;
    if(model is BoolOption) {
      value = model.value ? "1" : "0";
    } else {
      value = model.value;
    }

    final UpdateOptionRequest request = UpdateOptionRequest(
      code: model.code,
      value: value,
      isSecure: model.isSecure,
    );

    return await provider.send(request);
  }

}