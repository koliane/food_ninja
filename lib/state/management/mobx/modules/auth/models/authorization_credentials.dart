import 'package:food_ninja/core/domain/entities/auth/dto/authorization_credentials_dto.dart';

class AuthorizationCredentials implements AuthorizationCredentialsDto {
  String _email = '';
  String _password = '';

  @override
  String get email => _email;

  set email(String value) {
    _email = value;
  }

  @override
  String get password => _password;

  set password(String value) {
    _password = value;
  }
}