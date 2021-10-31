import 'package:food_ninja/core/domain/entities/restaurant/request/restaurant_base_request.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/restaurant_base_response.dart';

abstract class RestaurantProviderPort {
  Future<RestaurantBaseResponse> send(covariant RestaurantBaseRequest request);
}