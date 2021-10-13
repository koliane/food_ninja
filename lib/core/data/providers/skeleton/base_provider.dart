import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';

abstract class BaseProvider {
  const BaseProvider();

  Future send(covariant BaseRequest request);
}