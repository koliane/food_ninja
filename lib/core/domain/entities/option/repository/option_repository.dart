import '../model/bool_option.dart';
import '../model/option.dart';
import '../port/provider/option_crud_provider_port.dart';
import '../service/options_props.dart';
import '../../skeleton/collection/base_collection.dart';
import '../../skeleton/model/base_model.dart';
import '../../skeleton/repository/base_repository.dart';
import '../../skeleton/repository/crud_repository.dart';
import 'package:food_ninja/core/domain/entities/skeleton/response/dto/code_value_dto.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/code_value_request.dart';
import 'package:food_ninja/core/domain/entities/skeleton/response/list_response.dart';
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
    final ListResponse<CodeValueDto> response = await provider.send(BaseRequest());

    final BaseCollection<Option> collection = BaseCollection<Option>();
    response.list.forEach((element) {
      final String code = element.code;
      Option option;
      if(OptionsProps.isBool(code)) {
        option = BoolOption(code, element.value == "1");
      } else {
        option = Option(element.code, element.value);
      }

      collection.add(option);
    });

    return collection;
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

    final CodeValueRequest request = CodeValueRequest(model.code, value);

    return await provider.send(request);
  }

}