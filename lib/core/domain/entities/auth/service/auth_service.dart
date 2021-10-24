import 'package:food_ninja/core/domain/entities/auth/dto/access_recovery_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/dto/authorization_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';

import '../repository/auth_repository.dart';

class AuthService {
  const AuthService();

    
  Future register(RegistrationCredentialsDto credentialsDto) async {
    return const AuthRepository().register(credentialsDto);
  }

  
  Future verifyAndRegister(RegistrationCredentialsDto credentialsDto) async {
    return const AuthRepository().verifyAndRegister(credentialsDto);
  }
  
  Future authorize(AuthorizationCredentialsDto credentialsDto) async {
    return const AuthRepository().authorize(credentialsDto);
  }
  
  Future sendAccessRecoveryVerificationCode(AccessRecoveryCredentialsDto credentialsDto) async {
    return const AuthRepository().sendAccessRecoveryVerificationCode(credentialsDto);
  }
  
  Future verifyResetCode(AccessRecoveryCredentialsDto credentialsDto) async {
    return const AuthRepository().verifyResetCode(credentialsDto);
  }
  
  Future createNewPassword(AccessRecoveryCredentialsDto credentialsDto) async {
    return const AuthRepository().createNewPassword(credentialsDto);
  }
}