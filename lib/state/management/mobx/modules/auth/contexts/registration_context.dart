import 'package:food_ninja/core/domain/entities/auth/model/already_registered_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/base_auth_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/successfully_registered_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/validation_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/verification_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/verification_required_status.dart';
import 'package:food_ninja/core/domain/entities/auth/service/auth_service.dart';
import 'package:food_ninja/state/management/mobx/modules/auth/models/registration_credentials.dart';
import 'package:food_ninja/state/management/mobx/modules/route/payloads/auth_verification_code_payload.dart';
import 'package:food_ninja/state/management/state_facade.dart';


class RegistrationContext {
  final RegistrationCredentials credentials;

  RegistrationContext(): credentials = RegistrationCredentials();

  Future register() async {
    final BaseAuthStatus status = await const AuthService().register(credentials);

    switch(status.runtimeType) {
      case ValidationFailureStatus:
        StateFacade().app.showSnackBar('Проверьте правильность введенных данных');
        break;

      case AlreadyRegisteredStatus:
        StateFacade().app.showSnackBar('Такой пользователь уже зарегистрирован');
        break;

      case VerificationRequiredStatus:
        final AuthVerificationCodePayload routePayload = AuthVerificationCodePayload(
            email: credentials.email,
            onChanged: (value) {
              credentials.emailVerifyCode = value;
            },
            action: (){
              StateFacade().auth.verifyAndRegister();
            }
        );
        StateFacade().route.pushToVerificationPage(routePayload);
        break;
    }
  }

  Future verifyAndRegister() async {
    final BaseAuthStatus status = await const AuthService().verifyAndRegister(credentials);

    switch(status.runtimeType) {
      case VerificationFailureStatus:
        StateFacade().app.showSnackBar('Введен неверный код проверки');
        break;

      case SuccessfullyRegisteredStatus:
        StateFacade().route.goToRootSuccessfullyRegisteredStatusPage();
        break;
    }
  }
}