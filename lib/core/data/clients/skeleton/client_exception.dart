import 'package:food_ninja/core/infrastructure/exceptions/data_exception.dart';

class ClientException extends DataException {
  ClientException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}