import 'base_exception.dart';

class UiException extends BaseException {
  UiException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);
}