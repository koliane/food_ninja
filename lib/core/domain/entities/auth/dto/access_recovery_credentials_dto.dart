class AccessRecoveryCredentialsDto {
  final String email;
  final String password;
  String? emailVerifyCode;

  AccessRecoveryCredentialsDto({
    required this.email,
    required this.password,
    this.emailVerifyCode,
  });
}