import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

class IsAuthorizedResponse extends AuthBaseResponse {
  final bool isAuthorized;

  IsAuthorizedResponse(this.isAuthorized);
}