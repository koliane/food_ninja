import 'package:food_ninja/core/domain/entities/auth/dto/access_recovery_credentials_dto.dart';

class AccessRecoveryCredentials implements AccessRecoveryCredentialsDto {
  String _email = '';
  String _password = '';
  String? _emailVerifyCode = '';

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