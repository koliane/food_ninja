
import 'package:food_ninja/core/domain/entities/option/request/option_base_request.dart';

class CreateOptionRequest extends OptionBaseRequest{
  final String code;
  final String value;
  final bool isSecure;

  CreateOptionRequest({
    required this.code,
    required this.value,
    required this.isSecure,
  });
}