import 'base_auth_status.dart';

class SuccessfullyAuthorizedStatus extends BaseAuthStatus {
  final String userToken;

  SuccessfullyAuthorizedStatus(this.userToken);
}