import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

class AuthorizeResponse extends AuthBaseResponse {
  final bool successfullyAuthorized;
  final bool authenticationFailure;
  final String token;

  AuthorizeResponse({
    required this.token,
    this.successfullyAuthorized = false,
    this.authenticationFailure = false,
  });
}