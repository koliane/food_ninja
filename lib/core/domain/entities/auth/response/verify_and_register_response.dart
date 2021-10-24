import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

class VerifyAndRegisterResponse extends AuthBaseResponse {
  final bool verificationFailure;
  final bool successfullyRegistered;

  VerifyAndRegisterResponse({
    this.verificationFailure = false,
    this.successfullyRegistered = false,
  });
}