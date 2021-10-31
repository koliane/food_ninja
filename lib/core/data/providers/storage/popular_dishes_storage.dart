import 'package:dio/dio.dart' as dio;
import 'package:food_ninja/core/data/clients/api/api_client.dart';
import 'package:food_ninja/core/data/providers/mappers/dish_orm_mapper.dart';
import 'package:food_ninja/core/data/providers/mappers/restaurant_orm_mapper.dart';
import 'package:food_ninja/core/data/providers/orm_model/dish/dish_orm.dart';
import 'package:food_ninja/core/data/providers/orm_model/restaurant/restaurant_orm.dart';
import 'package:food_ninja/core/data/providers/skeleton/base_provider.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';

class PopularDishesStorage extends BaseProvider{
  static PopularDishesStorage? _instance;

  bool isLoaded = false;

  final List<DishOrm> dishes = [];
  final List<RestaurantOrm> restaurants = [];


  PopularDishesStorage._internal();

  factory PopularDishesStorage() {
    return _instance ?? PopularDishesStorage._internal();
  }


  @override
  Future send(covariant BaseRequest request) async {
    if(isLoaded) {
      return isLoaded = !isLoaded;
    }

    final dio.Response httpResponse = await ApiClient().popularDishes();
    // Map<String, dynamic> responseMap = httpResponse.data;
    final List response = httpResponse.data;

    response.forEach((value) {
      final DishOrm dishOrm = DishOrmMapper().fromDefault(value);
      final RestaurantOrm restaurantOrm = RestaurantOrmMapper().fromDefault(value['restaurant']);

      dishes.add(dishOrm);
      restaurants.add(restaurantOrm);
    });


  }

  void reset() {
    _instance = null;
  }

}