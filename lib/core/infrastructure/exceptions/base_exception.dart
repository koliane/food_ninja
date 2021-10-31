class BaseException implements Exception {
  final String message;
  final String? customerMessage;
  final Exception? realException;

  BaseException(this.message, {
    this.realException,
    this.customerMessage,
  });

  @override
  String toString() {
    return
      "$message\r\n${customerMessage ?? ''}${realException != null ? realException.toString() : ''}"
    ;
  }
}