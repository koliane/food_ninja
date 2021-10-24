import 'package:food_ninja/core/domain/entities/auth/dto/access_recovery_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/request/auth_base_request.dart';

class CreateNewPasswordRequest extends AuthBaseRequest {
  final AccessRecoveryCredentialsDto credentials;

  CreateNewPasswordRequest(this.credentials);
}