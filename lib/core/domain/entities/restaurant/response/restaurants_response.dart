import 'package:food_ninja/core/data/providers/orm_model/restaurant/restaurant_orm.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/restaurant_base_response.dart';
import 'package:food_ninja/core/domain/entities/skeleton/response/value_response.dart';

class RestaurantsResponse extends RestaurantBaseResponse {
  List<RestaurantOrm> list ;
// class RestaurantsResponse extends ValueResponse<List<RestaurantOrm>> {
  RestaurantsResponse(this.list);

}