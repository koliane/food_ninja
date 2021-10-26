import 'package:food_ninja/core/data/providers/entities/option/secure_storage/option_crud_provider.dart' as secure_option_crud_provider;
import 'package:food_ninja/core/data/providers/entities/option/sqlite/option_crud_provider.dart' as sqlite_option_crud_provider;
import 'package:food_ninja/core/data/providers/skeleton/crud_provider.dart';
import 'package:food_ninja/core/domain/entities/option/port/provider/option_crud_provider_port.dart';
import 'package:food_ninja/core/domain/entities/option/request/read_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/request/update_option_request.dart';
import 'package:food_ninja/core/domain/entities/option/response/all_options_response.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';

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
  Future read(ReadOptionRequest request) async {
    final AllOptionsResponse sqliteOptions = await const sqlite_option_crud_provider.OptionCrudProvider.read().send(request);
    final AllOptionsResponse secureOptions = await const secure_option_crud_provider.OptionCrudProvider.read().send(request);

    return AllOptionsResponse(
      ordinary: sqliteOptions.ordinary,
      secure: secureOptions.secure,
    );
  }

  @override
  Future update(UpdateOptionRequest request) async {
    // final Option option = request.option;
    if(request.isSecure) {
      await const secure_option_crud_provider.OptionCrudProvider.update().send(request);
    } else {
      await const sqlite_option_crud_provider.OptionCrudProvider.update().send(request);
    }

    return true;
  }
}