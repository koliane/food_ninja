import 'package:dio/dio.dart' as dio;
import 'package:food_ninja/core/data/clients/api/api_client.dart';
import 'package:food_ninja/core/domain/entities/auth/request/register_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/register_response.dart';
import 'package:food_ninja/core/data/providers/skeleton/base_provider.dart';
import 'package:food_ninja/core/domain/entities/auth/request/auth_base_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/auth_base_response.dart';
import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';


enum AuthProviderActionsEnum {
    register,
}

class AuthProvider extends BaseProvider implements AuthProviderPort {
  final AuthProviderActionsEnum _operation;
  const AuthProvider.register(): _operation = AuthProviderActionsEnum.register;

  Future<RegisterResponse> register(RegisterRequest request) async {
    final dio.Response httpResponse = await ApiClient().register(
        email: request.credentials.email,
        password: request.credentials.password
    );

    final Map<String, dynamic> responseMap = httpResponse.data;
    final String statusCode = responseMap['status_code'] ?? '';

    return RegisterResponse(
      needToVerifyEmail: responseMap['showCheckCodeField'] ?? false,
      validationFailure: statusCode == 'VALIDATION_FAILURE',
      alreadyRegistered: statusCode == 'ALREADY_REGISTERED',
    );
  }

  Future<AuthBaseResponse> send(AuthBaseRequest request) async {
    switch(_operation) {
      case AuthProviderActionsEnum.register:
        return register(request as RegisterRequest);
      
    }
  }
}