import 'package:food_ninja/core/data/providers/skeleton/base_provider.dart';
import 'package:food_ninja/core/data/providers/storage/popular_dishes_storage.dart';
import 'package:food_ninja/core/domain/entities/dish/request/get_popular_dishes_request.dart';
import 'package:food_ninja/core/domain/entities/restaurant/port/provider/restaurant_provider_port.dart';
import 'package:food_ninja/core/domain/entities/restaurant/request/restaurant_base_request.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/restaurant_base_response.dart';
import 'package:food_ninja/core/domain/entities/restaurant/response/restaurants_response.dart';
import 'package:food_ninja/core/domain/entities/skeleton/request/base_request.dart';

enum DishRestaurantProviderActions {
  popular,
}

class DishRestaurantProvider extends BaseProvider implements RestaurantProviderPort {
  final DishRestaurantProviderActions _operation;
  const DishRestaurantProvider.popular(): _operation = DishRestaurantProviderActions.popular;


  Future<RestaurantsResponse> fromPopularDishes(BaseRequest request) async {
    final PopularDishesStorage storage = PopularDishesStorage();
    await storage.send(request);

    return RestaurantsResponse(storage.restaurants);
  }


  @override
  Future<RestaurantsResponse> send(RestaurantBaseRequest request) {
    switch(_operation) {
      case DishRestaurantProviderActions.popular:
        return fromPopularDishes(request);
    }
  }

}