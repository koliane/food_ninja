import 'package:food_ninja/core/domain/entities/restaurant/model/restaurant.dart';
import 'package:food_ninja/core/domain/entities/skeleton/collection/base_collection.dart';

import '../repository/restaurant_repository.dart';

class RestaurantService {
  const RestaurantService();

    
  Future<BaseCollection<Restaurant>> getNearestRestaurants() async {
    return const RestaurantRepository().getNearestRestaurants();
  }

  Future<BaseCollection<Restaurant>> getPopularDishesRestaurants() async {
    return const RestaurantRepository().getPopularDishesRestaurants();
  }
}