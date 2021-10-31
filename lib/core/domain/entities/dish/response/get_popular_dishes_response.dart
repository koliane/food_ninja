import 'package:food_ninja/core/data/providers/orm_model/dish/dish_orm.dart';
import 'package:food_ninja/core/domain/entities/dish/response/dish_base_response.dart';

class GetPopularDishesResponse extends DishBaseResponse {
  final List<DishOrm> list;

  GetPopularDishesResponse(this.list);
}