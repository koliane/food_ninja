import 'core_exception.dart';

class EntityException extends CoreException {
  EntityException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}