class RegistrationCredentialsDto {
  final String login;
  final String email;
  final String password;
  String? emailVerifyCode;

  RegistrationCredentialsDto({
    required this.email,
    required this.password,
    this.login = '',
    this.emailVerifyCode,
  });
}