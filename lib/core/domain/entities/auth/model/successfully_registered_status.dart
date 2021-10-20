import 'base_auth_status.dart';

class SuccessfullyRegisteredStatus extends BaseAuthStatus {
  final String userToken;

  SuccessfullyRegisteredStatus(this.userToken);

}