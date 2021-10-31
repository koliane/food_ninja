import 'package:food_ninja/core/data/providers/orm_model/restaurant/restaurant_orm.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/restaurant_base_response.dart';

class GetNearestRestaurantsResponse extends RestaurantBaseResponse {
  final List<RestaurantOrm> list;

  GetNearestRestaurantsResponse(this.list);
}