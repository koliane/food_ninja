import 'package:food_ninja/core/infrastructure/exceptions/data_exception.dart';

class MapperException extends DataException {
  MapperException(String message, {
    String? customerMessage,
    Exception? realException,
  }): super(message, customerMessage: customerMessage, realException: realException);

}