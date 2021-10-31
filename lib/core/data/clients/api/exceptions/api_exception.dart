import 'package:food_ninja/core/data/clients/skeleton/client_exception.dart';

class ApiException extends ClientException {
  ApiException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}