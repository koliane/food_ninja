import 'package:food_ninja/core/application/contexts/auth/registration_context.dart';

class AuthContexts {
  static final AuthContexts _instance = AuthContexts._internal();

  RegistrationContext? _registration;


  AuthContexts._internal();

  factory AuthContexts() {
    return _instance;
  }

  RegistrationContext get registration {
    _registration ??= RegistrationContext();

    return _registration!;
  }

  void reset() {
    _registration = null;
  }
}