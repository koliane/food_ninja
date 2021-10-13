import 'base_response.dart';

class ListResponse<T> extends BaseResponse {
  final List<T> list;

  ListResponse(this.list);
}