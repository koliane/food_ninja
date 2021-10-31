import 'package:food_ninja/core/domain/entities/skeleton/response/base_response.dart';

class ValueResponse<T> extends BaseResponse {
  final T value;

  ValueResponse(this.value);
}