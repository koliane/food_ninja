import 'package:food_ninja/core/domain/entities/skeleton/response/dto/code_value_dto.dart';

import 'option_base_response.dart';

class AllOptionsResponse extends OptionBaseResponse {
  final List<CodeValueDto> ordinary;
  final List<CodeValueDto> secure;

  AllOptionsResponse({
    this.ordinary= const [],
    this.secure = const []
  });
}