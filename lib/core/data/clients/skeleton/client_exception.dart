import 'package:food_ninja/core/infrastructure/exceptions/data_exception.dart';

class ClientException extends DataException {
  ClientException([String? message]): super(message);
}