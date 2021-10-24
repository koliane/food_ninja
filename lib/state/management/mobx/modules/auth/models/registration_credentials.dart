import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';

class RegistrationCredentials implements RegistrationCredentialsDto {
  String _login = '';
  String _email = '';
  String _password = '';
  String? _emailVerifyCode = '';

  @override
  String get login {
    return _login;
  }

  set login(String value) {
    _login = value;
  }

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

  @override
  String? get emailVerifyCode => _emailVerifyCode;

  @override
  set emailVerifyCode(String? value) {
    _emailVerifyCode = value;
  }
}