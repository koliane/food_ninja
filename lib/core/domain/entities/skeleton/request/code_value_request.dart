import 'base_request.dart';

class CodeValueRequest extends BaseRequest {
  final String code;
  final String value;

  CodeValueRequest(this.code, this.value);
}