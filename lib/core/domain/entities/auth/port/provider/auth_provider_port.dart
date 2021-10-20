import 'package:food_ninja/core/domain/entities/auth/request/auth_base_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';

abstract class AuthProviderPort {
  Future<AuthBaseResponse> send(covariant AuthBaseRequest request);
}