import 'package:food_ninja/core/domain/entities/dish/request/dish_base_request.dart';
import 'package:food_ninja/core/domain/entities/dish/response/dish_base_response.dart';

abstract class DishProviderPort {
  Future<DishBaseResponse> send(covariant DishBaseRequest request);
}