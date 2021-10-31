import 'core_exception.dart';

class DataException extends CoreException {
  DataException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}