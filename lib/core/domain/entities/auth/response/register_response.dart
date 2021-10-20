import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

class RegisterResponse extends AuthBaseResponse {
  final bool validationFailure;
  final bool needToVerifyEmail;
  final bool alreadyRegistered;

  RegisterResponse({
    this.needToVerifyEmail = false,
    this.validationFailure = false,
    this.alreadyRegistered = false,
  });
}