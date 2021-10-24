import 'package:food_ninja/core/domain/entities/auth/model/base_auth_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/no_such_user_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/successfully_checked_reset_code_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/successfully_password_changed_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/validation_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/verification_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/verification_required_status.dart';
import 'package:food_ninja/core/domain/entities/auth/service/auth_service.dart';
import 'package:food_ninja/state/management/mobx/modules/auth/models/access_recovery_credentials.dart';
import 'package:food_ninja/state/management/mobx/modules/route/payloads/auth_verification_code_payload.dart';
import 'package:food_ninja/state/management/state_facade.dart';


class AccessRecoveryContext {
  final AccessRecoveryCredentials credentials;

  AccessRecoveryContext(): credentials = AccessRecoveryCredentials();

  Future sendAccessRecoveryVerificationCode() async {
    final BaseAuthStatus status = await const AuthService().sendAccessRecoveryVerificationCode(credentials);

    switch(status.runtimeType) {
      case NoSuchUserStatus:
        StateFacade().app.showSnackBar('Нет такого пользователя');
        break;
      case VerificationRequiredStatus:
        final AuthVerificationCodePayload payload = AuthVerificationCodePayload(
          email: credentials.email,
          onChanged: (value) {
            credentials.emailVerifyCode = value;
          },
          action: verifyResetCode
        );

        StateFacade().route.pushToVerificationPage(payload);
        break;
    }
  }


  Future verifyResetCode() async {
    final BaseAuthStatus status = await const AuthService().verifyResetCode(credentials);

    switch(status.runtimeType) {
      case VerificationFailureStatus:
        StateFacade().app.showSnackBar('Введен некорректный код');
        break;
      case SuccessfullyCheckedResetCodeStatus:
        StateFacade().route.pushToNewPasswordPage();
        break;
    }
  }


  Future createNewPassword() async {
    final BaseAuthStatus status = await const AuthService().createNewPassword(credentials);
    switch(status.runtimeType) {
      case ValidationFailureStatus:
        StateFacade().app.showSnackBar('Введите более сложный пароль');
        break;
      case SuccessfullyPasswordChangedStatus:
        StateFacade().route.goToRootPasswordResetSuccessfulStatusPage();
        break;
    }
  }
}