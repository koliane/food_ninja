import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

class CreateNewPasswordResponse extends AuthBaseResponse {
  final bool validationFailure;
  final bool successPasswordChanged;

  CreateNewPasswordResponse({
    this.successPasswordChanged = false,
    this.validationFailure = false,
  });
}