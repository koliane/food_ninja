import 'package:food_ninja/core/infrastructure/value_objects/value_code.dart';

import 'base_auth_status.dart';

class ValidationFailureStatus extends BaseAuthStatus {
  final List<ValueCode> fails;

  ValidationFailureStatus([List<ValueCode>? fails]): fails = fails ?? [];

}