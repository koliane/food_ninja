import 'package:food_ninja/core/data/clients/api/exceptions/api_exception.dart';
import 'package:food_ninja/core/domain/entities/auth/request/create_new_password_request.dart';
import 'package:food_ninja/core/domain/entities/auth/request/is_authorized_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/create_new_password_response.dart';
import 'package:food_ninja/core/domain/entities/auth/request/verify_reset_code_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/is_authorized_response.dart';
import 'package:food_ninja/core/domain/entities/auth/response/verify_reset_code_response.dart';
import 'package:food_ninja/core/domain/entities/auth/request/send_access_recovery_verification_code_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/send_access_recovery_verification_code_response.dart';
import 'package:food_ninja/core/domain/entities/auth/request/authorize_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/authorize_response.dart';
import 'package:food_ninja/core/domain/entities/auth/request/verify_and_register_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/verify_and_register_response.dart';
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
  verifyAndRegister,
  authorize,
  sendAccessRecoveryVerificationCode,
  verifyResetCode,
  createNewPassword,
  isAuthorized,
}

class AuthProvider extends BaseProvider implements AuthProviderPort {
  final AuthProviderActionsEnum _operation;
  const AuthProvider.createNewPassword(): _operation = AuthProviderActionsEnum.createNewPassword;
  const AuthProvider.verifyResetCode(): _operation = AuthProviderActionsEnum.verifyResetCode;
  const AuthProvider.sendAccessRecoveryVerificationCode(): _operation = AuthProviderActionsEnum.sendAccessRecoveryVerificationCode;
  const AuthProvider.authorize(): _operation = AuthProviderActionsEnum.authorize;
  const AuthProvider.verifyAndRegister(): _operation = AuthProviderActionsEnum.verifyAndRegister;
  const AuthProvider.register(): _operation = AuthProviderActionsEnum.register;
  const AuthProvider.isAuthorized(): _operation = AuthProviderActionsEnum.isAuthorized;

  Future<RegisterResponse> register(RegisterRequest request) async {
    final dio.Response httpResponse = await ApiClient().register(
        login: request.credentials.login,
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

  Future<VerifyAndRegisterResponse> verifyAndRegister(VerifyAndRegisterRequest request) async {
    final dio.Response httpResponse = await ApiClient().register(
        login: request.credentials.login,
        email: request.credentials.email,
        password: request.credentials.password,
        emailVerifyCode: request.credentials.emailVerifyCode
    );

    final Map<String, dynamic> responseMap = httpResponse.data;
    final String statusCode = responseMap['status_code'] ?? '';

    return VerifyAndRegisterResponse(
      verificationFailure: statusCode == 'VERIFICATION_FAILURE',
      successfullyRegistered: statusCode == 'SUCCESS_REGISTERED',
    );
  }


  Future<AuthorizeResponse> authorize(AuthorizeRequest request) async {
    final dio.Response httpResponse = await ApiClient().authorize(
        email: request.credentials.email,
        password: request.credentials.password,
    );

    final Map<String, dynamic> responseMap = httpResponse.data;
    final String statusCode = responseMap['status_code'] ?? '';
    final String token = responseMap['token'] ?? '';
    final bool isSuccessfullyAuthorized = statusCode == 'SUCCESS_AUTHORIZED';

    if(isSuccessfullyAuthorized && token.isEmpty) {
      throw ApiException('С сервера не пришел токен авторизации');
    }

    return AuthorizeResponse(
      token: token,
      successfullyAuthorized: isSuccessfullyAuthorized,
      authenticationFailure: statusCode == 'AUTHENTICATION_FAILURE',
    );
  }

  Future<SendAccessRecoveryVerificationCodeResponse> sendAccessRecoveryVerificationCode(SendAccessRecoveryVerificationCodeRequest request) async {
    final dio.Response httpResponse = await ApiClient().sendAccessRecoveryEmailCode(
      email: request.credentials.email,
    );

    final Map<String, dynamic> responseMap = httpResponse.data;

    final String statusCode = responseMap['status_code'] ?? '';

    return SendAccessRecoveryVerificationCodeResponse(
      noSuchUser: statusCode == 'NO_SUCH_USER',
      verificationRequired: statusCode == 'VERIFICATION_REQUIRED',
    );
  }


  Future<VerifyResetCodeResponse> verifyResetCode(VerifyResetCodeRequest request) async {
    final dio.Response httpResponse = await ApiClient().checkAccessRecoveryResetCode(
      email: request.credentials.email,
      code: request.credentials.emailVerifyCode!,
    );

    final Map<String, dynamic> responseMap = httpResponse.data;
    final String statusCode = responseMap['status_code'] ?? '';

    return VerifyResetCodeResponse(
      verificationFailure: statusCode == 'VERIFICATION_FAILURE',
      successVerification: statusCode == 'SUCCESS_VERIFICATION'
    );
  }

  Future<CreateNewPasswordResponse> createNewPassword(CreateNewPasswordRequest request) async {
    final dio.Response httpResponse = await ApiClient().createNewPassword(
      email: request.credentials.email,
      password: request.credentials.password,
      code: request.credentials.emailVerifyCode!,
    );

    final Map<String, dynamic> responseMap = httpResponse.data;
    final String statusCode = responseMap['status_code'] ?? '';

    return CreateNewPasswordResponse(
      validationFailure: statusCode == 'VALIDATION_FAILURE',
      successPasswordChanged: statusCode == 'SUCCESS_PASSWORD_CHANGED'
    );
  }

  Future<IsAuthorizedResponse> isAuthorized(AuthBaseRequest request) async {
    final dio.Response httpResponse = await ApiClient().isAuthorized();
    final bool isAuthorized = httpResponse.data['is_auth'] == true;

    print( httpResponse.data);

    return IsAuthorizedResponse(isAuthorized);
  }


  Future<AuthBaseResponse> send(AuthBaseRequest request) async {
    switch(_operation) {
      case AuthProviderActionsEnum.createNewPassword:
        return createNewPassword(request as CreateNewPasswordRequest);
      case AuthProviderActionsEnum.verifyResetCode:
        return verifyResetCode(request as VerifyResetCodeRequest);
      case AuthProviderActionsEnum.sendAccessRecoveryVerificationCode:
        return sendAccessRecoveryVerificationCode(request as SendAccessRecoveryVerificationCodeRequest);
      case AuthProviderActionsEnum.authorize:
        return authorize(request as AuthorizeRequest);
      case AuthProviderActionsEnum.verifyAndRegister:
        return verifyAndRegister(request as VerifyAndRegisterRequest);
      case AuthProviderActionsEnum.register:
        return register(request as RegisterRequest);
      case AuthProviderActionsEnum.isAuthorized:
        return isAuthorized(request as IsAuthorizedRequest);
    }
  }
}