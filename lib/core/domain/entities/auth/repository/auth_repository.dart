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

}

