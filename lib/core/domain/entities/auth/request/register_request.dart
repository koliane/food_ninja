import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/request/auth_base_request.dart';

class RegisterRequest extends AuthBaseRequest {
  final RegistrationCredentialsDto credentials;

  RegisterRequest(this.credentials);
}