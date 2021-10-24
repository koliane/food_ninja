import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

class VerifyResetCodeResponse extends AuthBaseResponse {
  final bool verificationFailure;
  final bool successVerification;

  VerifyResetCodeResponse({
    this.verificationFailure = false,
    this.successVerification = false,
  });
}