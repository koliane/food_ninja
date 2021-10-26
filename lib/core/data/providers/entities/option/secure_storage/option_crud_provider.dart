import 'package:food_ninja/core/data/clients/secure_storage/secure_storage_client.dart';
import 'package:food_ninja/core/data/providers/skeleton/crud_provider.dart';
import 'package:food_ninja/core/domain/entities/option/port/provider/option_crud_provider_port.dart';
import 'package:food_ninja/core/domain/entities/option/request/create_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/request/delete_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/request/read_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/request/update_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/response/all_options_response.dart';
import 'package:food_ninja/core/domain/entities/skeleton/response/dto/code_value_dto.dart';

class OptionCrudProvider extends CrudProvider implements OptionCrudProviderPort {
  const OptionCrudProvider.create() : super.create();
  const OptionCrudProvider.read() : super.read();
  const OptionCrudProvider.update() : super.update();
  const OptionCrudProvider.delete() : super.delete();

  @override
  Future create(CreateOptionRequest request) {
    return SecureStorageClient().write(request.code, request.value);
  }

  @override
  Future delete(DeleteOptionRequest request) async {
    return SecureStorageClient().delete(request.code);
  }

  @override
  Future<AllOptionsResponse> read(ReadOptionRequest request) async {
    final Map<String, String> optionsMap = await SecureStorageClient().readAll();

    final List<CodeValueDto> resultList = [];
    for(final String code in optionsMap.keys) {
      final String value = optionsMap[code]!;
      final CodeValueDto model = CodeValueDto(code, value);
        resultList.add(model);
    }

    return AllOptionsResponse(secure: resultList);
  }

  @override
  Future<bool> update(UpdateOptionRequest request) async {
    await SecureStorageClient().write(request.code, request.value);
    return true;
  }
}