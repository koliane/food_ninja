import 'package:food_ninja/state/management/mobx/modules/route/payloads/auth_verification_code_payload.dart';
import 'package:mobx/mobx.dart';
import 'package:food_ninja/state/management/mobx/modules/route/internals/base_route_actions.dart';
import 'package:food_ninja/state/routes/routes.dart';

part 'route_state.g.dart';

class _RouteState extends RouteState with _$_RouteState {

}

abstract class RouteState extends BaseRouteActions with Store {
  factory RouteState.create() => _RouteState();
  RouteState();


  @action
  void back() {
    maybePop();
  }

  @action
  void goToRootLoginPage() {
    pushNamedAndRemoveUntil(Routes.login);
  }

  @action
  void goToRootRegistrationPage() {
    pushNamedAndRemoveUntil(Routes.registration);
  }

  @action
  void pushToVerificationPage(AuthVerificationCodePayload payload) {
    pushNamed(Routes.verificationCode, payload);
  }

  @action
  void pushToForgotPasswordPage() {
    pushNamed(Routes.forgotPassword);
  }

  @action
  void pushToNewPasswordPage() {
    pushNamed(Routes.newPassword);
  }

  @action
  void goToRootSuccessfullyRegisteredStatusPage() {
    pushNamedAndRemoveUntil(Routes.readyProfileStatus);
  }

  @action
  void goToRootPasswordResetSuccessfulStatusPage() {
    pushNamedAndRemoveUntil(Routes.passwordResetSuccessfulStatus);
  }



  @action
  void goToRootMainPage() {
    pushNamedAndRemoveUntil(Routes.main);
  }
}