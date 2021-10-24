import 'package:food_ninja/core/domain/entities/auth/model/authentication_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/base_auth_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/successfully_authorized_status.dart';
import 'package:food_ninja/core/domain/entities/auth/service/auth_service.dart';
import 'package:food_ninja/state/management/mobx/modules/auth/models/authorization_credentials.dart';
import 'package:food_ninja/state/management/state_facade.dart';

class AuthorizationContext {
  final AuthorizationCredentials credentials;

  AuthorizationContext(): credentials = AuthorizationCredentials();

  Future authorize() async {
    final BaseAuthStatus status = await const AuthService().authorize(credentials);

    switch(status.runtimeType) {
      case AuthenticationFailureStatus:
        StateFacade().app.showSnackBar('Некорректный логин или пароль');
        break;
      case SuccessfullyAuthorizedStatus:
        StateFacade().route.goToRootMainPage();
        break;
    }
  }
}