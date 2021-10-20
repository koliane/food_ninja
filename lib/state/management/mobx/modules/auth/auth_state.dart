import 'package:food_ninja/core/application/use_cases/auth/auth_case.dart';
import 'package:food_ninja/core/domain/entities/auth/dto/registration_credentials_dto.dart';
import 'package:food_ninja/core/domain/entities/auth/model/already_registered_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/base_auth_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/validation_failure_status.dart';
import 'package:food_ninja/core/domain/entities/auth/model/verification_required_status.dart';
import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

class AuthState = _AuthState with _$AuthState;

abstract class _AuthState with Store {

  @action
  Future register() async {
    print('button is pushed');
    //TODO

    BaseAuthStatus status = await AuthCase().register(RegistrationCredentialsDto(email: 'asdf@mail.ru', password: 'password'));
    switch(status.runtimeType) {
      case ValidationFailureStatus:
        // state.registrationValidationFailure.value = true;
        break;

      case AlreadyRegisteredStatus:
        // state.registrationUserAlreadyExists.value = true;
        break;

      case VerificationRequiredStatus:
        // state.registrationValidationFailure.value = false;
        // state.registrationUserAlreadyExists.value = false;
        //
        // StoreFacade().routeStore.actions.pushToRegistrationVerifyPage();
        break;
    }
  }
}