import 'base_exception.dart';

class CoreException extends BaseException {
  CoreException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}