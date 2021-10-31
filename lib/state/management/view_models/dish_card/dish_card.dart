import 'package:food_ninja/core/domain/entities/dish/model/dish.dart';
import 'package:food_ninja/core/domain/entities/restaurant/model/restaurant.dart';

class DishCard {
  final Restaurant restaurant;
  final Dish dish;
  DishCard({
    required this.restaurant,
    required this.dish,
  });
}