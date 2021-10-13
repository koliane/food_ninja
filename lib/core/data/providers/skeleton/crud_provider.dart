import 'package:food_ninja/core/infrastructure/enums/crud_enum.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';
import 'base_provider.dart';

abstract class CrudProvider extends BaseProvider{
  final CrudEnum _operation;

  const CrudProvider.create(): _operation = CrudEnum.create;
  const CrudProvider.read(): _operation = CrudEnum.read;
  const CrudProvider.update(): _operation = CrudEnum.update;
  const CrudProvider.delete(): _operation = CrudEnum.delete;

  Future create(covariant BaseRequest request);
  Future read(covariant BaseRequest request);
  Future update(covariant BaseRequest request);
  Future delete(covariant  BaseRequest request);

  @override
  Future send(BaseRequest request) {
    switch(_operation) {
      case CrudEnum.create:
        return create(request);
      case CrudEnum.read:
        return read(request);
      case CrudEnum.update:
        return update(request);
      case CrudEnum.delete:
        return delete(request);
    }
  }


}