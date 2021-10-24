import 'package:food_ninja/core/domain/entities/auth/dto/authorization_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/request/auth_base_request.dart';

class AuthorizeRequest extends AuthBaseRequest {
  final AuthorizationCredentialsDto credentials;

  AuthorizeRequest(this.credentials);
}