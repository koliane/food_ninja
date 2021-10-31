import 'package:food_ninja/core/domain/entities/dish/model/dish.dart';
import 'package:food_ninja/core/domain/entities/skeleton/collection/base_collection.dart';

import '../repository/dish_repository.dart';

class DishService {
  const DishService();

  Future<BaseCollection<Dish>> getPopularDishes() async {
    return DishRepository().withRestaurant()
      .getPopularDishes();
  }

}