import 'package:food_ninja/state/management/mobx/modules/auth/contexts/access_recovery_context.dart';

import 'contexts/authorization_context.dart';

import 'contexts/registration_context.dart';
import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

class AuthState = _AuthState with _$AuthState;

abstract class _AuthState with Store {
  RegistrationContext? _registrationContext;
  AuthorizationContext? _authorizationContext;
  AccessRecoveryContext? _accessRecoveryContext;

  Future register() async {
    registrationContext.register();
  }

  Future verifyAndRegister() async {
    registrationContext.verifyAndRegister();
  }

  Future authorize() async {
    authorizationContext.authorize();
  }

  Future sendAccessRecoveryVerificationCode() async {
    accessRecoveryContext.sendAccessRecoveryVerificationCode();
  }

  Future createNewPassword() async {
    accessRecoveryContext.createNewPassword();
  }


  RegistrationContext get registrationContext {
    return _registrationContext ??= RegistrationContext();
  }

  AuthorizationContext get authorizationContext {
    return _authorizationContext ??= AuthorizationContext();
  }

  AccessRecoveryContext get accessRecoveryContext {
    return _accessRecoveryContext ??= AccessRecoveryContext();
  }

  void resetRegistrationContext() {
    _registrationContext = null;
  }

  void resetAuthorizationContext() {
    _authorizationContext = null;
  }

  void resetAccessRecoveryContext() {
    _accessRecoveryContext = null;
  }
}