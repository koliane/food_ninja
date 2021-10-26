import 'package:food_ninja/core/domain/entities/option/model/option.dart';
import 'package:food_ninja/core/domain/entities/option/request/option_base_request.dart';

class UpdateOptionRequest extends OptionBaseRequest {
  final String code;
  final String value;
  final bool isSecure;

  UpdateOptionRequest({
    required this.code,
    required this.value,
    required this.isSecure,
  });
}