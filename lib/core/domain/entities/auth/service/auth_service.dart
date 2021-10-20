import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';

import '../repository/auth_repository.dart';

class AuthService {
  const AuthService();

    
  Future register(RegistrationCredentialsDto credentialsDto) async {
    return const AuthRepository().register(credentialsDto);
  }

}