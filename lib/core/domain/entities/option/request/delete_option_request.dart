import 'package:food_ninja/core/domain/entities/option/request/option_base_request.dart';

class DeleteOptionRequest extends OptionBaseRequest {
  final String code;

  DeleteOptionRequest(this.code);
}