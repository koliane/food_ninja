import 'package:food_ninja/core/domain/entities/auth/model/successfully_password_changed_status.dart';
import 'package:food_ninja/core/domain/entities/auth/request/create_new_password_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/create_new_password_response.dart';

import 'package:food_ninja/core/domain/entities/auth/model/successfully_checked_reset_code_status.dart';
import 'package:food_ninja/core/domain/entities/auth/request/verify_reset_code_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/verify_reset_code_response.dart';

import 'package:food_ninja/core/domain/entities/auth/dto/access_recovery_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/model/no_such_user_status.dart';
import 'package:food_ninja/core/domain/entities/auth/request/send_access_recovery_verification_code_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/send_access_recovery_verification_code_response.dart';

import 'package:food_ninja/core/domain/entities/auth/dto/authorization_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/model/authentication_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/successfully_authorized_status.dart';
import 'package:food_ninja/core/domain/entities/auth/request/authorize_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/authorize_response.dart';

import 'package:food_ninja/core/domain/entities/auth/model/successfully_registered_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/verification_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/request/verify_and_register_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/verify_and_register_response.dart';

import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/model/already_registered_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/validation_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/verification_required_status.dart';
import 'package:food_ninja/core/domain/entities/auth/request/register_request.dart';
import 'package:food_ninja/core/domain/entities/auth/response/register_response.dart';

import 'package:food_ninja/core/domain/entities/auth/port/provider/auth_provider_port.dart';
import 'package:food_ninja/core/infrastructure/di/provider_di.dart';
import '../../skeleton/repository/base_repository.dart';



class AuthRepository extends BaseRepository{
  const AuthRepository();

    
  Future register(RegistrationCredentialsDto credentialsDto) async {
    final AuthProviderPort provider = ProviderDi.getAuthRegisterProvider();
    final RegisterRequest request = RegisterRequest(credentialsDto);
    final RegisterResponse response = await provider.send(request) as RegisterResponse;

    if(response.validationFailure) {
      return ValidationFailureStatus();
    }

    if(response.alreadyRegistered) {
      return AlreadyRegisteredStatus();
    }

    if(response.needToVerifyEmail) {
      return VerificationRequiredStatus();
    }

  }
  
  Future verifyAndRegister(RegistrationCredentialsDto credentialsDto) async {
    final AuthProviderPort provider = ProviderDi.getAuthVerifyAndRegisterProvider();
    final VerifyAndRegisterRequest request = VerifyAndRegisterRequest(credentialsDto);
    final VerifyAndRegisterResponse response = await provider.send(request) as VerifyAndRegisterResponse;

    if(response.verificationFailure) {
      return VerificationFailureStatus();
    }

    if(response.successfullyRegistered) {
      return SuccessfullyRegisteredStatus();
    }
  }
  
  Future authorize(AuthorizationCredentialsDto credentialsDto) async {
    final AuthProviderPort provider = ProviderDi.getAuthAuthorizeProvider();
    final AuthorizeRequest request = AuthorizeRequest(credentialsDto);
    final AuthorizeResponse response = await provider.send(request) as AuthorizeResponse;

    if(response.successfullyAuthorized) {
      return SuccessfullyAuthorizedStatus();
    }

    if(response.authenticationFailure) {
      return AuthenticationFailureStatus();
    }
  }
  
  Future sendAccessRecoveryVerificationCode(AccessRecoveryCredentialsDto credentialsDto) async {
    final AuthProviderPort provider = ProviderDi.getAuthSendAccessRecoveryVerificationCodeProvider();
    final SendAccessRecoveryVerificationCodeRequest request = SendAccessRecoveryVerificationCodeRequest(credentialsDto);
    final SendAccessRecoveryVerificationCodeResponse response = await provider.send(request) as SendAccessRecoveryVerificationCodeResponse;

    if(response.noSuchUser) {
      return NoSuchUserStatus();
    }

    if(response.verificationRequired) {
      return VerificationRequiredStatus();
    }
  }
  
  Future verifyResetCode(AccessRecoveryCredentialsDto credentialsDto) async {
    final AuthProviderPort provider = ProviderDi.getAuthVerifyResetCodeProvider();
    final VerifyResetCodeRequest request = VerifyResetCodeRequest(credentialsDto);
    final VerifyResetCodeResponse response = await provider.send(request) as VerifyResetCodeResponse;

    if(response.verificationFailure) {
      return VerificationFailureStatus();
    }

    if(response.successVerification) {
      return SuccessfullyCheckedResetCodeStatus();
    }
  }
  
  Future createNewPassword(AccessRecoveryCredentialsDto credentialsDto) async {
    final AuthProviderPort provider = ProviderDi.getAuthCreateNewPasswordProvider();
    final CreateNewPasswordRequest request = CreateNewPasswordRequest(credentialsDto);
    final CreateNewPasswordResponse response = await provider.send(request) as CreateNewPasswordResponse;

    if(response.validationFailure) {
      return ValidationFailureStatus();
    }

    if(response.successPasswordChanged) {
      return SuccessfullyPasswordChangedStatus();
    }
  }
}

