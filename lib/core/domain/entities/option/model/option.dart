import '../../skeleton/model/base_model.dart';

class Option<T> extends BaseModel {
  String code;
  T value;
  final bool isSecure;

  Option(this.code, this.value, {
    this.isSecure = false
  });
}