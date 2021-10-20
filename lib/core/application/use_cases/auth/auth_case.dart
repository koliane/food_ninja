import 'package:food_ninja/core/application/contexts/auth/auth_contexts.dart';
import 'package:food_ninja/core/application/contexts/auth/registration_context.dart';
import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/service/auth_service.dart';

class AuthCase {
  Future register(RegistrationCredentialsDto credentialsDto) {
    final RegistrationContext registrationContext = AuthContexts().registration;
    registrationContext.fillByCredentials(credentialsDto);

    return const AuthService().register(credentialsDto);
  }
}