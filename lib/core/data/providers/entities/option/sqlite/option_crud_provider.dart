import 'package:food_ninja/core/domain/entities/option/port/provider/option_crud_provider_port.dart';
import 'package:food_ninja/core/data/clients/sqlite/orm/sqlite_orm.dart';
import 'package:food_ninja/core/data/clients/sqlite/sqlite_client.dart';
import 'package:food_ninja/core/domain/entities/skeleton/response/dto/code_value_dto.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/code_value_request.dart';
import 'package:food_ninja/core/domain/entities/skeleton/response/list_response.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';
import 'package:food_ninja/core/data/providers/skeleton/crud_provider.dart';


class OptionCrudProvider extends CrudProvider implements OptionCrudProviderPort {
  const OptionCrudProvider.create() : super.create();
  const OptionCrudProvider.read() : super.read();
  const OptionCrudProvider.update() : super.update();
  const OptionCrudProvider.delete() : super.delete();

  @override
  Future create(covariant BaseRequest request) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future delete(covariant BaseRequest request) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<ListResponse<CodeValueDto>> read(covariant BaseRequest request) async {
    final List<OptionData> optionDataList = await SqliteClient.getOptions();
    final List<CodeValueDto> resultList = [];
    optionDataList.forEach((element) {
      final CodeValueDto model = CodeValueDto(element.code, element.value);
      resultList.add(model);
    });

    return ListResponse(resultList);
  }

  @override
  Future<bool> update(CodeValueRequest request) async {
    return SqliteClient.updateOption(request.code, request.value);
  }

}