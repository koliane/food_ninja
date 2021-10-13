import 'base_response_dto.dart';

class CodeValueDto extends BaseResponseDto {
  String code;
  String value;

  CodeValueDto(this.code, this.value);
}