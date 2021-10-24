import 'package:food_ninja/core/data/clients/skeleton/client_exception.dart';

class ApiException extends ClientException {
  ApiException([String? message]) : super(message);
}