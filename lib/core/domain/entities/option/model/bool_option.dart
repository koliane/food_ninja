import 'option.dart';

class BoolOption extends Option<bool>{
  BoolOption(String code, bool value, {bool? isSecure}) : super(code, value, isSecure: isSecure ?? false);
}