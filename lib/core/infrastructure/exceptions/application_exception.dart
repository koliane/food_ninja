import 'core_exception.dart';

class ApplicationException extends CoreException {
  ApplicationException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}