import 'base_exception.dart';

class StateException extends BaseException {
  StateException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}