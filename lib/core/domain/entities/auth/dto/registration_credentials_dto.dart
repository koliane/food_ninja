class RegistrationCredentialsDto {
  final String email;
  final String password;
  String? emailVerifyCode;

  RegistrationCredentialsDto({
    required this.email,
    required this.password,
    this.emailVerifyCode,
  });
}