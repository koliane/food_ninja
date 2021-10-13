import '../../skeleton/model/base_model.dart';

class Option<T> extends BaseModel {
  String code;
  T value;

  Option(this.code, this.value);
}