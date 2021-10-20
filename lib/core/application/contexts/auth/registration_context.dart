import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';

class RegistrationContext {
  String? email;
  String? password;
  String? emailVerifyCode;

  void fillByCredentials(RegistrationCredentialsDto credentialsDto) {
    email = credentialsDto.email;
    password = credentialsDto.password;
    emailVerifyCode = credentialsDto.emailVerifyCode;
  }
}