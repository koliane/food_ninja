import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

class SendAccessRecoveryVerificationCodeResponse extends AuthBaseResponse {
  final bool verificationRequired;
  final bool noSuchUser;

  SendAccessRecoveryVerificationCodeResponse({
    this.noSuchUser = false,
    this.verificationRequired = false,
  });
}